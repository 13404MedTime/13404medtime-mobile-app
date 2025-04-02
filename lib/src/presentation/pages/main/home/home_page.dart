import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../config/router/routes_arguments.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/utils/base_functions.dart';
import '../../../bloc/main/home/home_bloc.dart';
import '../../../components/snack/snack.dart';
import '../profile/disease_history/args/disease_history_args.dart';
import 'my_visit/purpose/args/sub_purpose_page_args.dart';
import 'survey/widgets/survey_widget.dart';
import 'widgets/empty_item.dart';
import 'widgets/home_appointments.dart';
import 'widgets/home_history_list.dart';
import 'widgets/home_my_visits_list.dart';
import 'widgets/home_statistics_list.dart';
import 'widgets/home_title.dart';
import 'widgets/home_top_performance.dart';
import 'widgets/horizontal_home_item_shimmer.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (_scrollController.offset == 0) {
            return true;
          } else {
            _scrollController.jumpTo(0);
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: context.theme.colorScheme.background,
            surfaceTintColor: context.theme.colorScheme.background,
            title: Text(context.translate('home_menu')),
          ),
          body: RefreshIndicator.adaptive(
            onRefresh: () async => initStateController(),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) => state.subscriptionStatusLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        HomeTitleWidget(
                          title: context.translate('statistics'),
                          haveSubtitle: false,
                        ),
                        HomeStatisticsWidget(
                          avarageDistance: state.avarageDistance,
                          avarageHeart: state.avarageHeart.toInt(),
                        ),
                        HomeTitleWidget(
                          title: context.translate('appointments'),
                          haveSubtitle: false,
                        ),
                        const HomeAppointmentsWidget(),
                        if (state.myVisits.isNotEmpty) ...[
                          HomeTitleWidget(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.showAllMyVisits,
                              );
                            },
                            title: context.translate('my_visits'),
                            subtitle: context.translate('show_all'),
                            haveSubtitle: state.myVisits.isNotEmpty,
                          ),
                          HomeMyVisitsListWidget(
                            myVisits: state.myVisits,
                            onTap: (index) {
                              Navigator.pushNamed(
                                context,
                                Routes.myVisit,
                                arguments: MyVisitArgument(
                                  myVisit: state.myVisits[index],
                                ),
                              );
                            },
                          ),
                          const SliverGap(8),
                        ] else if (state.isVisitsLoading && state.myVisits.isEmpty) ...[
                          const SliverPadding(
                            padding: EdgeInsets.only(top: 24),
                            sliver: SliverToBoxAdapter(
                              child: HorizontalHomeItemShimmer(),
                            ),
                          ),
                        ] else
                          SliverToBoxAdapter(
                            child: EmptyItem(
                              title: context.translate('my_visits'),
                              desc: context.translate('not_visits'),
                              iconPath: 'assets/png/visit_empty.png',
                            ),
                          ),
                        HomeTitleWidget(
                          title: context.translate('top_performance'),
                          haveSubtitle: false,
                        ),
                        HomeTopPerformanceWidget(
                          bestDistance: state.bestDistance,
                          bestTime: state.bestTime,
                        ),
                        if (state.medicalHistory.isNotEmpty) ...[
                          HomeTitleWidget(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.diseaseHistory,
                                arguments: DiseaseHistoryArgs(
                                  diseaseItemsList: state.medicalHistory,
                                  medicalHistoryDrugNames: state.medicalHistoryDrugNames,
                                  medicalHistoryDrugs: state.medicalHistoryDrugs,
                                  medicationTimes: state.medicationTimes,
                                ),
                              );
                            },
                            title: context.translate('medical_history'),
                            subtitle: context.translate('show_all'),
                            haveSubtitle: state.medicalHistory.isNotEmpty,
                          ),
                          HomeHistoryListWidget(
                            medicalData: state.medicalHistory,
                            names: state.medicalHistoryDrugNames,
                            onTap: (index) {
                              if ((state.medicalHistory[index].amount ?? 0) > 0) {
                                Navigator.pushNamed(
                                  context,
                                  Routes.subPurposePage,
                                  arguments: SubPurposePageArgs(
                                    title: context.translate('medical_history'),
                                    naznachenieId: state.medicalHistory[index].guid ?? '',
                                    illName: state.medicalHistory[index].illName ?? '',
                                    comment: state.medicalHistory[index].comment ?? '',
                                  ),
                                );
                              } else {
                                Snack.showSnackBar(
                                  context,
                                  context.translate('drugs_are_not_available'),
                                );
                              }
                            },
                          ),
                          const SliverGap(8),
                        ] else if (state.isMedicalHistoryLoading && state.medicalHistory.isEmpty) ...[
                          const SliverPadding(
                            padding: EdgeInsets.only(top: 24),
                            sliver: SliverToBoxAdapter(
                              child: HorizontalHomeItemShimmer(),
                            ),
                          ),
                        ] else
                          SliverToBoxAdapter(
                            child: EmptyItem(
                              title: context.translate('medical_history'),
                              desc: context.translate('not_medical_history'),
                              iconPath: 'assets/png/history_medic_empty.png',
                            ),
                          ),
                        ValueListenableBuilder(
                          valueListenable: localSource.prefes.listenable(
                            keys: [AppKeys.surveyCount],
                          ),
                          builder: (_, value, __) => SurveyWidget(
                            onTap: () async {
                              await sendAnalyticsEvent(
                                tag: FirebaseAnalyticsEvents.surveyMainViewBtn,
                                parameters: {'user_name': localSource.firstName},
                              ).then((value) {
                                if (context.mounted) {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.survey,
                                  );
                                }
                              });
                            },
                            countAnalysis: localSource.surveyCount,
                          ),
                        ),
                        AppUtils.kSliverGap40,
                        AppUtils.kSliverGap40,
                      ],
                    ),
            ),
          ),
          floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => previous.unreadNotificationsCount != current.unreadNotificationsCount,
            builder: (context, state) => FloatingActionButton(
              onPressed: () async {
                await sendAnalyticsEvent(
                  tag: FirebaseAnalyticsEvents.notificationBellMainViewBtn,
                  parameters: {'user_name': localSource.firstName},
                ).then((value) {
                  if (context.mounted) {
                    Navigator.pushNamed(
                      context,
                      Routes.notifications,
                      arguments: context.read<HomeBloc>(),
                    );
                  }
                });
              },
              child: Badge(
                isLabelVisible: state.unreadNotificationsCount > 0,
                label: Text(
                  '${state.unreadNotificationsCount}',
                  style: TextStyle(
                    color: context.theme.colorScheme.surface,
                    fontSize: 10,
                  ),
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      );
}
