import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/survey/get_analysis_survey/analysis_survey_response.dart';
import '../../../../../bloc/main/survey/survey_bloc.dart';
import '../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../survey_page.dart';

part 'package:madadio_client_mobile/src/presentation/pages/main/home/mixin/surveys_items_mixin.dart';

class SurveysItemsWidget extends StatelessWidget with SurveyItemsMixin {
  const SurveysItemsWidget({
    super.key,
    required this.innerList,
  });

  final List<InnerList> innerList;

  @override
  Widget build(BuildContext context) => SliverList.builder(
        itemCount: innerList.length,
        itemBuilder: (context, index) {
          final InnerList userSurveys = innerList[index];
          if (userSurveys.surveys.isEmpty) {
            return AppUtils.kBox;
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: Text(
                    userSurveys.date,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.mediaQuery.size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: AppUtils.kPaddingHorizontal16,
                    itemCount: userSurveys.surveys.length,
                    itemBuilder: (_, index) => SurveyItem(
                      key: ValueKey(userSurveys.surveys[index].guid),
                      survey: userSurveys.surveys[index],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      );
}

class SurveyItem extends StatelessWidget {
  const SurveyItem({
    super.key,
    required this.survey,
  });

  final AnalysisSurveyMainResponse survey;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 150,
        child: Column(
          children: [
            if ((survey.image ?? '').isNotEmpty && (survey.file ?? '').isEmpty)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.photoView,
                    arguments: survey.image ?? '',
                  );
                },
                child: CustomCachedNetworkImage(
                  imageUrl: survey.image ?? 'https://assets.stickpng.com/images/61447cd55953a50004ee16d9.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            if ((survey.image ?? '').isEmpty && (survey.file ?? '').isNotEmpty)
              GestureDetector(
                onTap: () async {
                  // await launchUrl(
                  //   Uri.parse(survey.file ?? ''),
                  //   mode: LaunchMode.externalApplication,
                  // );
                  context.read<SurveyBloc>().add(
                        SurveySelectedEvent(survey: survey),
                      );
                },
                child: const Image(
                  image: AssetImage(
                    'assets/png/file.png',
                  ),
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            AppUtils.kBoxHeight8,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Text(
                survey.fileTitle ?? '',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      );
}
