import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/auth/register/register_user_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';
import 'register_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  RegisterUserRepositoryImpl({
    required this.apiClient,
    required this.baseClient,
    required this.networkInfo,
  });

  final ApiClient apiClient;
  final ApiClient baseClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.registerUser(
          request,
          Constants.projectId,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> forBalanceId({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await baseClient.forBalanceId(
          request,
          Constants.projectId,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }
}
