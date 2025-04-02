part of 'package:madadio_client_mobile/src/presentation/pages/main/home/survey/survey_page.dart';

mixin SurveyMixin on State<SurveyPage> {
  late final SurveyBloc _bloc = context.read<SurveyBloc>();
  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  void initController() {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    _bloc.add(const GetAnalysisSurveyEvent());
    searchSurvey();
  }

  void searchSurvey() {}

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    searchController.dispose();
    searchFocusNode.dispose();
  }
}

class InnerList {
  InnerList({
    required this.date,
    required this.surveys,
  });

  final String date;
  final List<AnalysisSurveyMainResponse> surveys;
}
