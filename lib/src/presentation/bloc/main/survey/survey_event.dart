part of 'survey_bloc.dart';

@freezed
class SurveyEvent with _$SurveyEvent {
  const factory SurveyEvent.getAnalysisSurvey() = GetAnalysisSurveyEvent;

  const factory SurveyEvent.searchSurvey({required String searchText}) =
      SearchSurveyEvent;

  const factory SurveyEvent.uploadFileImage({
    required dynamic result,
  }) = UploadFleImageEvent;

  const factory SurveyEvent.stopSuccessState() = StopSuccessStateEvent;

  const factory SurveyEvent.surveySelected({
    required AnalysisSurveyMainResponse survey,
  }) = SurveySelectedEvent;
}
