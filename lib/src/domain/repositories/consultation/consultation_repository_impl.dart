part of 'consultation_repository.dart';

final class ConsultationRepositoryImpl implements ConsultationRepository {
  const ConsultationRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
    required this.dio,
  }) : super();

  final ApiClient apiClient;
  final NetworkInfo networkInfo;
  final Dio dio;

  @override
  Future<Either<Failure, DoctorsTypesResponse>> getDoctorsTypes({
    bool isCache = false,
    required Map<String, dynamic> request,
  }) async {
    if (isCache) {
      final result = localSource.getKey(CacheKeys.doctorType);
      if (result.isNotEmpty) {
        return Right(DoctorsTypesResponse.fromJson(jsonDecode(result)));
      } else {
        return Left(CacheFailure(message: 'some error'));
      }
    } else {
      try {
        final Response response = await dio.get(
          '${Constants.baseUrl}v2/object-slim/get-list/category',
          queryParameters: {'data': jsonEncode(request)},
        );
        await localSource.setKey(
          CacheKeys.doctorType,
          jsonEncode(response.data),
        );
        return Right(DoctorsTypesResponse.fromJson(response.data));
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withDioError(error: error).failure);
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(ServerError.withError(message: error.toString()).failure);
      }
    }
  }

  @override
  Future<Either<Failure, DoctorsResponse>> getDoctors({
    required Map<String, dynamic> request,
  }) async {
    try {
      final response = await apiClient.getDoctorsList(
        request,
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
