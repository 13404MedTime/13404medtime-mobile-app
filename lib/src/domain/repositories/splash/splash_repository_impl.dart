part of 'splash_repository.dart';

final class SplashRepositoryImpl implements SplashRepository {
  const SplashRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
    required this.dio,
  }) : super();

  final ApiClient apiClient;
  final NetworkInfo networkInfo;
  final Dio dio;

  @override
  Future<Either<Failure, CheckForProductionResponse>> checkForProduction({
    required String version,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          '${Constants.baseUrl}v2/object-slim/get-list/subscription_ios',
          queryParameters: <String, dynamic>{
            'data': jsonEncode(
              {
                'limit': 1,
                'offset': 0,
                'version': [version],
                'view_fields': ['version'],
              },
            )
          },
        );
        return Right(CheckForProductionResponse.fromJson(response.data));
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
