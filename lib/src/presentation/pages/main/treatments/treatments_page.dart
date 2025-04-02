import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/services/notification_service.dart';
import '../../../bloc/main/home/home_bloc.dart';
import '../../../bloc/main/treatments/treatments_bloc.dart';
import '../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import '../home/widgets/empty_item.dart';
import '../profile/widgets/custom_dialog.dart';
import 'widgets/my_treatments_item_widget.dart';

part 'mixin/treatments_mixin.dart';

class TreatmentsPage extends StatefulWidget {
  const TreatmentsPage({super.key});

  @override
  State<TreatmentsPage> createState() => _TreatmentsPageState();
}

class _TreatmentsPageState extends State<TreatmentsPage> with TreatmentsMixin {
  @override
  Widget build(BuildContext context) => BlocListener<TreatmentsBloc, TreatmentsState>(
        listenWhen: (p, c) => p.medicineTakingList.length != c.medicineTakingList.length,
        listener: (_, state) {
          if (state.medicineTakingList.isNotEmpty) {
            context.read<HomeBloc>()
              ..add(const GetAppointmentsForSaveEvent())
              ..add(const GetAppointmentsEvent());
          } else {
            cancelAllNotifications();
            context.read<HomeBloc>().add(const GetAppointmentsEvent());
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text(context.translate('treatments'))),
          body: BlocBuilder<TreatmentsBloc, TreatmentsState>(
            buildWhen: (previous, current) {
              // if (current.homeUpdate) {
              //   context.read<HomeBloc>().add(const GetAppointmentsEvent());
              // }
              if (previous.isAdding != current.isAdding && current.isAdding) {
                Future.delayed(const Duration(milliseconds: 1), () {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  );
                });
              }
              return true;
            },
            builder: (_, state) => Stack(
              children: [
                RefreshIndicator.adaptive(
                  onRefresh: () async {
                    _bloc.add(const GetMedicineTakingEvent());
                    context.read<HomeBloc>()
                      ..add(const GetAppointmentsEvent())
                      ..add(const GetAppointmentsForSaveEvent());
                  },
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      if (state.medicineTakingList.isEmpty && !state.isLoading) ...[
                        SliverFillRemaining(
                          child: EmptyItem(
                            title: '',
                            desc: context.translate('no_medicine'),
                            iconPath: 'assets/png/visit_empty.png',
                          ),
                        ),
                      ] else ...[
                        SliverPadding(
                          padding: state.isAdding ? AppUtils.kPaddingAll16 : AppUtils.kPaddingHor16T16B24,
                          sliver: SliverList.separated(
                            itemCount: state.medicineTakingList.length,
                            itemBuilder: (_, index) => Material(
                              borderRadius: AppUtils.kBorderRadius16,
                              color: context.theme.colorScheme.surface,
                              child: Builder(builder: (_) {
                                final data = state.medicineTakingList[index];
                                late final String times;

                                /// ichiladigan vaqtlar '- 08:00, 12:38'
                                if (data.hoursOfTheDay?.isEmpty ?? true) {
                                  times = '';
                                } else if (data.hoursOfTheDay!.length == 1) {
                                  times = '- ${data.hoursOfTheDay![0]}';
                                } else {
                                  times = '- ${[
                                    for (int i = 0; i < data.hoursOfTheDay!.length.doubleTheListCount; i++)
                                      i.isOdd
                                          ? i.exactIndex == data.hoursOfTheDay!.length - 2
                                              ? ' ${context.translate('and')} '
                                              : ', '
                                          : data.hoursOfTheDay![i.exactIndex]
                                  ].join()}';
                                }
                                late final String days;

                                /// ichiladigan kunlar 'mo, tu, we'
                                if (data.frequency != null) {
                                  switch (data.frequency!) {
                                    case 'several_times_day':
                                      days = context.translate('daily');
                                    case 'specific_days':
                                      if (data.weekDays?.isEmpty ?? true) {
                                        days = '';
                                      } else if (data.weekDays!.length == 1) {
                                        days = context.translate(getWeekday(data.weekDays![0]));
                                      } else {
                                        days = [
                                          for (int i = 0; i < (data.weekDays?.length.doubleTheListCount ?? 0); i++)
                                            i.isOdd ? ', ' : context.translate(getWeekday(data.weekDays![i.exactIndex]))
                                        ].join();
                                      }
                                    case 'always':
                                      days = context.translate('daily');
                                    default:
                                      days = '';
                                  }
                                } else {
                                  days = '';
                                }
                                return MyTreatmentsItemWidget(
                                  onDelete: () {
                                    showDialog<bool>(
                                      context: context,
                                      builder: (_) => CustomDialog(
                                        changeColor: true,
                                        cancelActionText: context.translate('no'),
                                        defaultActionText: context.translate('yes'),
                                        title: context.translate('are_you_want_remove_drug'),
                                      ),
                                    ).then(
                                      (value) {
                                        if ((value ?? false) && data.guid != null) {
                                          _bloc.add(DeleteMedicineEvent(index));
                                        }
                                      },
                                    );
                                  },
                                  medicineName: ((data.preparatiId ?? '').isEmpty
                                          ? data.medicineName
                                          : data.preparatiIdData?.brandName) ??
                                      '',
                                  medicineDescription: '$days $times',
                                  medicineTime: data.description != null ? context.translate(data.description!) : '',
                                  showMedicineLeft: data.frequency != null && data.frequency != 'always',
                                  medicineLeft: context.translate('left').replaceFirst(
                                        '#',
                                        '${data.currentLeft == '' ? data.currentAmount : data.currentLeft} ${state.unitOfMissures[data.unitOfMeasureId]?.getName(data.currentLeft == '' ? data.currentAmount : data.currentLeft ?? 1) ?? ''}',
                                      ),
                                );
                              }),
                            ),
                            separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                          ),
                        ),
                        if (state.isAdding) ...[
                          const SliverToBoxAdapter(
                            child: CustomCircularProgressIndicator(),
                          ),
                          const SliverGap(16),
                        ]
                      ],
                    ],
                  ),
                ),
                if (state.isLoading) const CustomCircularProgressIndicator(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, Routes.addMedicine).then(
                (value) {
                  if (value == true) {
                    _bloc.add(const UpdateMedicineTakingEvent());
                  }
                },
              );
            },
            child: const Icon(Icons.add),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () async {
          //     await customModalBottomSheet<void>(
          //       height: 250,
          //       context: context,
          //       builder: (_, controller) => AddTypeBottomSheet(bloc: _bloc),
          //     );
          //   },
          //   child: Icon(
          //     Icons.add,
          //     color: context.theme.colorScheme.onPrimary,
          //   ),
          // ),
        ),
      );

  String getWeekday(String index) {
    switch (index) {
      case '0':
        return 'sun';
      case '1':
        return 'mon';
      case '2':
        return 'tue';
      case '3':
        return 'wed';
      case '4':
        return 'thu';
      case '5':
        return 'fri';
      case '6':
        return 'sat';
      default:
        return '';
    }
  }
}
