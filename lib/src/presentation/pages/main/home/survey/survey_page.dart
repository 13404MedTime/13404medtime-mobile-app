import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/survey/get_analysis_survey/analysis_survey_response.dart';
import '../../../../bloc/main/survey/survey_bloc.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../components/dialogs/dialogs.dart';
import '../../../../components/loading_widgets/modal_progress_hud.dart';
import '../medical_history/widgets/searching.dart';
import 'widgets/survey_items_widget.dart';

part 'package:madadio_client_mobile/src/presentation/pages/main/home/mixin/survey_mixin.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> with SurveyMixin {
  @override
  void initState() {
    super.initState();
    initController();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<SurveyBloc, SurveyState>(
        listener: (context, state) {
          if (state.isUploadFileImageSuccess) {
            context.read<SurveyBloc>().add(const StopSuccessStateEvent());
            context.read<SurveyBloc>().add(const GetAnalysisSurveyEvent());
          }
        },
        builder: (context, state) => SearchingWidget(
          title: context.translate('exam'),
          searchHintText: context.translate('search'),
          onChanged: (text) {
            if (text != null) {
              context.read<SurveyBloc>().add(SearchSurveyEvent(searchText: text));
            }
          },
          searchController: searchController,
          searchFocusNode: searchFocusNode,
          bottomNavigationBar: BottomNavigationButton(
            child: ElevatedButton(
              onPressed: () async {
                if (!state.isAnalysisSurveyLoading && !state.isUploadFileImageLoading) {
                  final result = await showChooseFile(
                    title: context.translate('add_file'),
                    context: context,
                    leftButtonText: '',
                    rightButtonText: '',
                    isUploadedFile: state.isAnalysisSurveyLoading,
                  );
                  if (result != null) {
                    if (!mounted) return;
                    context.read<SurveyBloc>().add(
                          UploadFleImageEvent(result: result),
                        );
                  }
                }
              },
              child: Text(context.translate('add_file')),
            ),
          ),
          child: ModalProgressHUD(
            inAsyncCall: state.isAnalysisSurveyLoading || state.isUploadFileImageLoading,
            child: searchController.text.trim().isEmpty && state.innerListAnalysisSurvey.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(
                            'assets/png/empty_survey.png',
                          ),
                          width: 234,
                        ),
                        const Gap(16),
                        Text(
                          context.translate('empty_file'),
                          style: TextStyle(
                            fontSize: 14,
                            height: 1,
                            color: context.color.onBackground50,
                          ),
                        ),
                      ],
                    ),
                  )
                : searchController.text.trim().isNotEmpty &&
                        checkListIsEmpty(state.innerListAnalysisSurveySearch.isNotEmpty
                            ? state.innerListAnalysisSurveySearch
                            : state.innerListAnalysisSurvey)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/png/empty_search.png',
                              ),
                              width: 234,
                            ),
                            const Gap(16),
                            Text(
                              context.translate('nothing_found'),
                              style: TextStyle(
                                fontSize: 14,
                                height: 1,
                                color: context.color.onBackground50,
                              ),
                            ),
                          ],
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SurveysItemsWidget(
                            innerList: state.innerListAnalysisSurveySearch.isNotEmpty
                                ? state.innerListAnalysisSurveySearch
                                : state.innerListAnalysisSurvey,
                          ),
                          const SliverGap(16),
                        ],
                      ),
          ),
        ),
      );

  bool checkListIsEmpty(final List<InnerList> list) {
    if (list.isEmpty) return true;
    int count = 0;
    for (final InnerList val in list) {
      count += val.surveys.length;
    }
    return count <= 0;
  }
}
