import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/my_appointments/switch_response.dart';
import '../../../../bloc/main/home/home_bloc.dart';
import '../../../../bloc/my_appointments/my_appointments_bloc.dart';
import '../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import '../widgets/empty_item.dart';
import 'widgets/appointment_item.dart';

part 'mixin/my_appointments_mixin.dart';

class MyAppointmentsPage extends StatefulWidget {
  const MyAppointmentsPage({
    super.key,
    required this.switchData,
  });

  final SwitchModel switchData;

  @override
  State<MyAppointmentsPage> createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> with MyAppointmentsMixin {
  @override
  void deactivate() {
    super.deactivate();
    context.read<HomeBloc>().add(
          UpdateCurrentAppointmentsCount(
            value: context.read<HomeBloc>().state.currentAppointmentsCount + appointmentCount,
          ),
        );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.translate('my_appointments'),
            style: context.textStyle.appBarTitle,
          ),
        ),
        body: Padding(
          padding: AppUtils.kPaddingHorizontal16,
          child: BlocBuilder<MyAppointmentsBloc, MyAppointmentsState>(
            builder: (_, state) => Stack(
              children: [
                (state.status == AppointmentStatus.loading &&
                            (state.switchData.today.isEmpty || state.switchData.tomorrow.isEmpty)) ||
                        (state.switchData.today.isNotEmpty || state.switchData.tomorrow.isNotEmpty)
                    ? RefreshIndicator(
                        onRefresh: () async {
                          _getInitialData();
                        },
                        child: CustomScrollView(
                          slivers: [
                            const SliverGap(20),

                            /// [when loading]
                            if (state.status == AppointmentStatus.loading &&
                                (state.switchData.today.isEmpty || state.switchData.tomorrow.isEmpty)) ...[
                              const SliverFillRemaining(
                                child: Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                              ),
                            ],

                            /// [when state isNotEmpty]
                            if (state.switchData.today.isNotEmpty || state.switchData.tomorrow.isNotEmpty) ...[
                              /// [today]
                              if (state.switchData.today.isNotEmpty) ...[
                                SliverToBoxAdapter(
                                  child: Text(
                                    context.translate('today'),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SliverGap(8),
                                SliverList.separated(
                                  itemCount: state.switchData.today.length,
                                  itemBuilder: (context, index) {
                                    final data = state.switchData.today[index];
                                    return AppointmentItemWidget(
                                      isLoading: state.isMedicineLoading,
                                      isChanged: state.changedItemIndex == index,
                                      imageUrl: data.imageUrl,
                                      name: data.branchName,
                                      time: data.dateTime,
                                      isToday: true,
                                      onChanged: (value) {
                                        _bloc.add(
                                          MyAppointmentsEvent.updateDrugStatus(
                                            onSuccess: () {},
                                            value: value,
                                            index: index,
                                            context: context,
                                          ),
                                        );
                                        if (value) {
                                          appointmentCount -= 1;
                                        } else {
                                          appointmentCount += 1;
                                        }
                                      },
                                      isTake: data.isTake,
                                    );
                                  },
                                  separatorBuilder: (context, index) => AppUtils.kBoxHeight12,
                                ),
                              ],

                              /// [tomorrow]
                              if (state.switchData.tomorrow.isNotEmpty) ...[
                                const SliverGap(16),
                                SliverToBoxAdapter(
                                  child: Text(
                                    context.translate('tomorrow'),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SliverGap(8),
                                SliverList.separated(
                                  itemCount: state.switchData.tomorrow.length,
                                  itemBuilder: (context, index) {
                                    final data = state.switchData.tomorrow[index];
                                    return AppointmentItemWidget(
                                      imageUrl: data.imageUrl,
                                      name: data.branchName,
                                      shortDescription: data.desc,
                                      time: data.dateTime,
                                      onChanged: (value) {},
                                      isTake: data.isTake,
                                    );
                                  },
                                  separatorBuilder: (context, index) => AppUtils.kBoxHeight12,
                                )
                              ],
                              const SliverSafeArea(sliver: SliverGap(0)),
                            ],

                            /// [when state isEmpty]
                            // else
                            //   SliverFillRemaining(
                            //     child: Center(
                            //       child: EmptyItem(
                            //         title: '',
                            //         desc: context.translate('not_medications'),
                            //         iconPath: 'assets/png/history_medic_empty.png',
                            //       ),
                            //     ),
                            //   ),
                            const SliverGap(16),
                          ],
                        ),
                      )
                    : Center(
                        child: EmptyItem(
                          title: '',
                          desc: context.translate('not_medications'),
                          iconPath: 'assets/png/history_medic_empty.png',
                        ),
                      ),
                if (state.isMedicineLoading)
                  const ColoredBox(
                    color: Colors.transparent,
                    child: SizedBox.expand(
                      child: CustomCircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
