part of 'search_repository.dart';

final class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
    required this.dio,
  }) : super();

  final ApiClient apiClient;
  final NetworkInfo networkInfo;
  final Dio dio;

  @override
  Future<Either<Failure, List<SearchAppointResponse>>> getSearchedAppointments(
    GetSearchedRequest request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getSearchedAppointments(
          {'data': request.data},
          Constants.projectId,
        );
        return Right(response.myAppointments ?? []);
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
  Future<Either<Failure, List<DoctorTypeModel>>> getSearchedCategories(
    GetSearchedRequest request,
  ) async {
    try {
      final Response response = await dio.get(
        '${Constants.baseUrl}v1/object-slim/get-list/category',
        queryParameters: {'data': jsonEncode(request.data)},
      );
      final DoctorsTypesResponse t = DoctorsTypesResponse.fromJson(
        response.data,
      );
      return Right(t.doctorsTypes ?? []);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, List<DoctorIdData>>> getSearchedDoctors(GetSearchedRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getSearchedDoctors(
          {'data': request.data},
          Constants.projectId,
        );
        return Right(response.doctorsTypes ?? []);
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
