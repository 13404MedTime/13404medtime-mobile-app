part of 'auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.apiClient,
    required this.baseClient,
    required this.networkInfo,
  }) : super();

  final ApiClient apiClient;
  final ApiClient baseClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, dynamic>> updateFcmTokenAndPlatformType({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await baseClient.updateFcmTokenAndPlatformType(
          request,
          Constants.projectId,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
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
  Future<Either<Failure, SendCodeResponse>> sendCode({
    required SendCodeRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.sendCode(request);
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withDioError(error: error).failure);
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withError(message: error.toString()).failure);
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, SendCodeResponse>> loginWithOption({required LoginWithOptionRequest request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.loginWithOption(
          request,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withDioError(error: error).failure);
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withError(message: error.toString()).failure);
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }
}
