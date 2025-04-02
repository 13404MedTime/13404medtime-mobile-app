import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/purpose/medication_times.dart';
import '../../../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../../bloc/main/profile/disease_history_bloc/disease_history_bloc.dart';
import '../../../../components/custom_texfield/custom_text_field.dart';
import '../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import '../../../../components/snack/snack.dart';
import '../../home/my_visit/purpose/args/sub_purpose_page_args.dart';
import '../../home/my_visit/purpose/widgets/purpose_item.dart';
import '../../home/widgets/empty_item.dart';
import '../selected_doctors/widgets/selected_doctor_shimmer_item.dart';
import 'args/disease_history_args.dart';
import 'widgets/searched_disease_item.dart';
import 'widgets/searched_doctor_disease_item.dart';

part 'mixin/disease_history_mixin.dart';

class DiseaseHistoryPage extends StatefulWidget {
  const DiseaseHistoryPage({super.key, required this.args});

  final DiseaseHistoryArgs args;

  @override
  State<DiseaseHistoryPage> createState() => _DiseaseHistoryPageState();
}

class _DiseaseHistoryPageState extends State<DiseaseHistoryPage> with DiseaseHistoryMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.translate('medical_history'),
            style: context.theme.appBarTheme.titleTextStyle,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 20),
            child: Padding(
              padding: AppUtils.kPaddingLeft16Top0Right16Bottom12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppUtils.kBoxHeight20,
                  CustomTextField(
                    contentPadding: AppUtils.kPaddingAll12,
                    haveBorder: false,
                    controller: _searchController,
                    fillColor: context.theme.colorScheme.background,
                    filled: true,
                    hintText: context.translate('search'),
                    onTap: () {},
                    onChanged: _onTextChanged,
                    prefixIcon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<DiseaseHistoryBloc, DiseaseHistoryState>(
            listenWhen: (previous, current) => previous.isScrollLoading != current.isScrollLoading,
            listener: (_, state) {
              if (state.isScrollLoading) {
                Future.delayed(const Duration(milliseconds: 1), () {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  );
                  // scrollController.jumpTo(scrollController.position.maxScrollExtent);
                });
              }
            },
            builder: (_, state) => (state.searchText.length >= 3 &&
                        (state.searchedAppoints.isNotEmpty ||
                            state.searchedCategory.isNotEmpty ||
                            state.searchedDoctors.isNotEmpty)) ||
                    (state.searchStatus == SearchStatus.loading && _searchController.text.isNotEmpty) ||
                    (state.searchText.length < 3 && state.diseaseItemsList.isNotEmpty)
                ? CustomScrollView(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    slivers: [
                      // when searched items
                      if (state.searchText.length >= 3 &&
                          (state.searchedAppoints.isNotEmpty ||
                              state.searchedCategory.isNotEmpty ||
                              state.searchedDoctors.isNotEmpty)) ...[
                        /// [searched Appoints]
                        if (state.searchedAppoints.isNotEmpty) ...[
                          SliverPadding(
                            padding: AppUtils.kPaddingAllB16,
                            sliver: SliverToBoxAdapter(
                              child: Text(context.translate('appointments')),
                            ),
                          ),
                          SliverPadding(
                            padding: AppUtils.kPaddingAll16T8B0,
                            sliver: SliverList.separated(
                              itemBuilder: (context, index) {
                                final appointment = state.searchedAppoints[index];
                                return SearchedDiseaseItem(
                                  title: appointment.illName ?? '',
                                  desc: appointment.comment ?? '',
                                  imageUrl: 'photo',
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    Routes.subPurposePage,
                                    arguments: SubPurposePageArgs(
                                      title: context.translate('medical_history'),
                                      naznachenieId: appointment.guid ?? '',
                                      illName: state.diseaseItemsList[index].illName ?? '',
                                      comment: (state.diseaseItemsList[index].comment ?? '').htmlToText,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                              itemCount: state.searchedAppoints.length,
                            ),
                          ),
                        ],

                        /// [searched Doctors]
                        if (state.searchedDoctors.isNotEmpty) ...[
                          SliverPadding(
                            padding: AppUtils.kPaddingAllB16,
                            sliver: SliverToBoxAdapter(
                              child: Text(context.translate('doctors')),
                            ),
                          ),
                          SliverPadding(
                            padding: AppUtils.kPaddingAll16T8B0,
                            sliver: SliverList.separated(
                              itemBuilder: (context, index) {
                                final doctor = state.searchedDoctors[index];
                                return SearchedDoctorDiseaseItem(
                                  data: doctor,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    Routes.myVisit,
                                    arguments: MyVisitArgument(
                                      isHavePurpose: false,
                                      doctor: doctor,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                              itemCount: state.searchedDoctors.length,
                            ),
                          ),
                        ],

                        /// [searched Categories]
                        if (state.searchedCategory.isNotEmpty) ...[
                          SliverPadding(
                            padding: AppUtils.kPaddingAllB16,
                            sliver: SliverToBoxAdapter(
                              child: Text(context.translate('category')),
                            ),
                          ),
                          SliverPadding(
                            padding: AppUtils.kPaddingAll16T8B0,
                            sliver: SliverList.separated(
                              itemBuilder: (context, index) {
                                final category = state.searchedCategory[index];
                                return SearchedDiseaseItem(
                                  title: category.categoryName ?? '',
                                  desc: category.description ?? '',
                                  imageUrl: category.icon ?? '',
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    Routes.specialists,
                                    arguments: category,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                              itemCount: state.searchedCategory.length,
                            ),
                          ),
                        ],

                        const SliverGap(16),
                      ] else if (state.searchStatus == SearchStatus.loading && _searchController.text.isNotEmpty) ...[
                        SliverPadding(
                          padding: AppUtils.kPaddingAll16,
                          sliver: SliverFillRemaining(
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => const SelectedDoctorShimmerItem(),
                              separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                              itemCount: 12,
                            ),
                          ),
                        ),
                      ]

                      /// [when searched empty]
                      // else if (_searchController.text.length >= 3)
                      //   SliverFillRemaining(
                      //     child: EmptyItem(
                      //       title: '',
                      //       desc: context.translate('not_medical_history'),
                      //       iconPath: 'assets/png/visit_empty.png',
                      //     ),
                      //   )

                      /// [when not searched items]
                      else if (state.searchText.length < 3)
                        SliverSafeArea(
                          minimum: AppUtils.kPaddingAll16,
                          sliver:
                              // state.diseaseItemsList.isEmpty
                              //     ? SliverFillRemaining(
                              //         child: EmptyItem(
                              //           title: '',
                              //           iconPath:
                              //               'assets/png/history_medic_empty.png',
                              //           desc: context
                              //               .translate('not_medical_history'),
                              //         ),
                              //       )
                              //     :
                              SliverList.separated(
                            itemCount: state.diseaseItemsList.length + (state.isScrollLoading ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (state.diseaseItemsList.length != index) {
                                final data = state.diseaseItemsList[index];
                                final List<String> items = [
                                  for (final SubPurposeMedicationTimesItem times
                                      in state.medicationTimes[data.guid] ?? [])
                                    getTimeText(
                                      times,
                                      state.medicalHistoryDrugs[times.data.medicineTakingId],
                                    ),
                                ];
                                return PurposeItemWidget(
                                  name: data.doctorIdData?.doctorName ?? '',
                                  subtitle: state.medicalHistoryDrugNames[data.guid]?.join(', ') ??
                                      context.translate('no_drugs'),
                                  imageUrl: data.doctorIdData?.medicPhoto ?? 'photo',
                                  title: data.illName ?? '',
                                  items: items,
                                  onTap: () {
                                    if ((data.amount ?? 0) > 0) {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.subPurposePage,
                                        arguments: SubPurposePageArgs(
                                          title: context.translate('medical_history'),
                                          naznachenieId: state.diseaseItemsList[index].guid ?? '',
                                          illName: data.illName ?? '',
                                          comment: (data.comment ?? '').htmlToText,
                                        ),
                                      );
                                    } else {
                                      Snack.showSnackBar(context, context.translate('drugs_unavaible'));
                                    }
                                  },
                                );
                              } else {
                                return const CustomCircularProgressIndicator();
                              }
                            },
                            separatorBuilder: (context, index) => AppUtils.kBoxHeight16,
                          ),
                        ),
                    ],
                  )
                : Center(
                    child: _searchController.text.length >= 3
                        ? EmptyItem(
                            title: '',
                            desc: context.translate('not_medical_history'),
                            iconPath: 'assets/png/visit_empty.png',
                          )
                        : EmptyItem(
                            title: '',
                            iconPath: 'assets/png/history_medic_empty.png',
                            desc: context.translate('not_medical_history'),
                          ),
                  ),
          ),
        ),
      );
}
