part of 'add_free_time_repository.dart';

class AddFreeTimeRepositoryImpl implements AddFreeTimeRepository {
  const AddFreeTimeRepositoryImpl({
    required this.apiClient,
    required this.baseClient,
    required this.networkInfo,
  });

  final ApiClient apiClient;
  final ApiClient baseClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, AddFreeTimeResponse>> addFreeTime(
      {required Map<String, dynamic> request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.addFreeTime(
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
  
  @override
  Future<Either<Failure, void>> updateFreeTime({required Map<String, dynamic> request}) async {
    if (await networkInfo.isConnected) {
      try {
        await apiClient.updateDoctorFreeTime(
          request,
          'Bearer ${localSource.accessToken}',
        );
        return const Right(null);
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
