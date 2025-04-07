part of 'add_medicine_repository.dart';

class AddMedicineRepositoryImpl implements AddMedicineRepository {
  AddMedicineRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  });

  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Metrics>> getMetrics() async {
    try {
      final response = await apiClient.getMetrics(
        {'data': <String, dynamic>{}},
        Constants.projectId,
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
  Future<Either<Failure, bool>> saveMedication(
    Map<String, dynamic> body,
  ) async {
    try {
      await apiClient.saveMedication(
        body,
        Constants.projectId,
      );
      return const Right(true);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, DrugsResponse>> getDrugs(String search) async {
    try {
      final response = await apiClient.getDrugs(
        {
          'data': {
            'additional_request': {
              'additional_field': 'guid',
              'additional_values': [null]
            },
            'view_fields': ['brand_name'],
            'search': search,
            'limit': 10
          }
        },
        Constants.projectId,
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
}
