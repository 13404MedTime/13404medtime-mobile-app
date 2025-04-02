part of 'survey_bloc.dart';

@freezed
class SurveyState with _$SurveyState {
  const factory SurveyState({
    @Default([]) List<AnalysisSurveyMainResponse> analysisSurvey,
    @Default([]) List<InnerList> innerListAnalysisSurvey,
    @Default([]) List<InnerList> innerListAnalysisSurveySearch,
    @Default(false) bool isAnalysisSurveyLoading,
    @Default(false) bool isUploadFileImageLoading,
    @Default(false) bool isUploadFileImageSuccess,
  }) = _SurveyState;
}
