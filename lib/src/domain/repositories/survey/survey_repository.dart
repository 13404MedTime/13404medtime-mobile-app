import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/survey/get_analysis_survey/analysis_survey_request.dart';
import '../../../data/models/survey/get_analysis_survey/analysis_survey_response.dart';
import '../../../data/models/survey/uploade_file_image/upload_file_image_request.dart';
import '../../../data/models/survey/uploade_file_image/upload_file_image_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'survey_repository_impl.dart';

abstract class SurveyRepository {
  const SurveyRepository();

  Future<Either<Failure, AnalysisSurveyResponse>> getAnalysisSurvey(
    AnalysisSurveyRequest request,
  );

  Future<Either<Failure, UploadFileImageResponse>> uploadFileImage(
    UploadFileImageRequest request,
  );
}
