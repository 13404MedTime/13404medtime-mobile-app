import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/health/add_health_response.dart';
import '../../../data/models/health/arterial_pressure_response.dart';
import '../../../data/models/health/blood_sugar_response.dart';
import '../../../data/models/health/pedometer_response.dart';
import '../../../data/models/health/twn_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'health_repository.dart';

class HealthRepositoryImpl implements HealthRepository {
  const HealthRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
    required this.dio,
  });

  final Dio dio;
  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<PedometerModel>>> getPedometer(
    Map<String, dynamic> request, {
    bool isCache = false,
  }) async {
    if (!isCache) {
      try {
        final response = await apiClient.getPedometer(request);
        return Right(response.pedometerList ?? []);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withDioError(error: error).failure);
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withError(message: error.toString()).failure);
      }
    } else {
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, List<ArterialPressureModel>>> getArterialPressure(
    Map<String, dynamic> request, {
    bool isCache = false,
  }) async {
    if (!isCache) {
      try {
        final response = await apiClient.getArterialPressure(request);
        return Right(response.arterialPressureList ?? []);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withDioError(error: error).failure);
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withError(message: error.toString()).failure);
      }
    } else {
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, List<BloodSugarModel>>> getBloodSugar(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.getBloodSugar(request);
      return Right(response.bloodSugarList ?? []);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, List<TWHModel>>> getTWH(
    Map<String, dynamic> request, {
    bool isCache = false,
  }) async {
    if (!isCache) {
      try {
        final response = await apiClient.getTWH(request);
        return Right(response.twhList ?? []);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withDioError(error: error).failure);
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withError(message: error.toString()).failure);
      }
    } else {
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, HealthResponse>> addHealth({
    required Map<String, dynamic> request,
    required String path,
  }) async {
    try {
      final response = await apiClient.addHealth(
        request,
        Constants.projectId,
        path,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, HealthResponse>> addListHealth({
    required List<Map<String, dynamic>> request,
    required String path,
  }) async {
    try {
      final Response response = await dio.put(
        '${Constants.baseUrl}v1/object/multiple-update/$path',
        data: {
          'data': {'objects': request}
        },
      );
      return Right(response.data);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}
