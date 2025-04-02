part of 'profile_repository.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({
    required this.apiClient,
    required this.baseClient,
    required this.networkInfo,
  }) : super();

  final ApiClient apiClient;
  final ApiClient baseClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, ProfileResponse>> updateProfile({required ProfileEditRequest request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.updateProfile(
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
  Future<Either<Failure, FavouriteDoctorResponse>> getFavouriteDoctors({required String request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getFavouriteDoctor(
          request,
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
  Future<Either<Failure, dynamic>> deleteUser() async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await apiClient.deleteUser(localSource.userId, Constants.projectId, {'data': <dynamic, dynamic>{}});
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
  Future<Either<Failure, dynamic>> deleteClient() async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await apiClient.deleteClient(localSource.userId, Constants.projectId, {'data': <dynamic, dynamic>{}});
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
  Future<Either<Failure, ProfileResponse>> updateUserLang({required Map<String, dynamic> request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await baseClient.updateUserLang(
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
  Future<Either<Failure, DoctorPatientResponse>> getPatient({required Map<String, dynamic> request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.doctorBookings(
          request,
          'Bearer ${localSource.accessToken}',
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
}
