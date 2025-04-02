part of 'treatments_repository.dart';

class TreatmentsRepositoryImpl implements TreatmentsRepository {
  TreatmentsRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  });

  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, MedicineTakingResponse>> getMedicineTaking({
    required int limit,
    required int offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        ///
        final response = await apiClient.getMedicineTaking(
          jsonEncode({
            'cleints_id': [localSource.userId],
            'is_from_patient': true,
            'with_relations': true,
          }),
          Constants.projectId,
          offset,
          limit,
        );
        // final response = await apiClient.getMedicineTakingSlim(
        //   Constants.projectId,
        //   jsonEncode({
        //     'cleints_id': [localSource.userId],
        //     'is_from_patient': true,
        //   }),
        //   10,
        //   0,
        // );
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
  Future<Either<Failure, bool>> deleteMedicine(String medicineId) async {
    if (await networkInfo.isConnected) {
      try {
        await apiClient.deleteMedicine(
          {'data': <String, dynamic>{}},
          medicineId,
          Constants.projectId,
        );
        return const Right(true);
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
  Future<Either<Failure, Metrics>> getMetrics() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getMetrics(
          {'data': <String, dynamic>{}},
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
}
