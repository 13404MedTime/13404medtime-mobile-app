part of 'survey_repository.dart';

final class SurveyRepositoryImpl extends SurveyRepository {
  const SurveyRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  }) : super();

  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, AnalysisSurveyResponse>> getAnalysisSurvey(AnalysisSurveyRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getAnalysisSurvey(request);
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
  Future<Either<Failure, UploadFileImageResponse>> uploadFileImage(UploadFileImageRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.uploadFileImage(request);
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
