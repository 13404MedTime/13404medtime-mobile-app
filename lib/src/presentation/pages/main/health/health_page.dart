import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/extension/extension.dart';
import '../../../../data/models/health/pedometer_response.dart';
import '../../../../data/models/health/sub_health_response.dart';
import '../../../bloc/health/health_bloc.dart';
import '../../../bloc/main/main_bloc.dart';
import '../../../components/dialogs/dialogs.dart';
import '../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import 'args/health_args.dart';
import 'widgets/arterial_pressure.dart';
import 'widgets/blood_sugar.dart';
import 'widgets/pedometer.dart';
import 'widgets/permission_app_bar.dart';
import 'widgets/temperature_weight_height.dart';

part 'mixin/health_mixin.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> with HealthMixin, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted) {
      if (state == AppLifecycleState.resumed && Platform.isIOS) {
        context.read<HealthBloc>().add(
              const GetStepsCountOfTodayEvent(),
            );
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HealthBloc, HealthState>(
        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
        builder: (context, state) => state.isLoading
            ? const Center(child: CustomCircularProgressIndicator())
            : Scaffold(
                appBar: (state.remindMeGivePermissionAppleHealth && Platform.isIOS)
                    ? PermissionAppBar(
                        onTap: Platform.isIOS
                            ? null
                            : () {
                                log('*& -> 1) ${state.remindMeGoogleFitInstallationLater && !localSource.isGoogleFitInstalled}');
                                log('*& -> 2) ${state.remindMeGoogleFitRegistrationLater && !localSource.isRegisteredFromGoogleFit}');
                                if (state.remindMeGoogleFitInstallationLater && !localSource.isGoogleFitInstalled) {
                                  context.read<HealthBloc>().add(
                                        PushPlayMarketForInstallGoogleFitEvent(
                                          context: context,
                                          isFromDialog: false,
                                        ),
                                      );
                                } else if (state.remindMeGoogleFitRegistrationLater &&
                                    !localSource.isRegisteredFromGoogleFit) {
                                  context.read<HealthBloc>().add(
                                        const PushGoogleFitForRegistrationEvent(),
                                      );
                                }
                              },
                        title: context.translate('health'),
                      )
                    : AppBar(title: Text(context.translate('health'))),
                body: BlocListener<MainBloc, MainState>(
                  listener: _listener,
                  child: BlocBuilder<HealthBloc, HealthState>(
                    builder: (context, state) => RefreshIndicator.adaptive(
                      onRefresh: () async => _initial(),
                      child: CustomScrollView(
                        slivers: [
                          const SliverGap(16),
                          SliverPadding(
                            padding: AppUtils.kPaddingHorizontal16,
                            sliver: SliverToBoxAdapter(
                              child: BlocBuilder<HealthBloc, HealthState>(
                                buildWhen: (previous, current) =>
                                    previous.pedometerList != current.pedometerList ||
                                    previous.isUpdatedPedometer != current.isUpdatedPedometer,
                                builder: (_, state) {
                                  if (state.pedometerList.isNotEmpty) {
                                    final List<PedometerModel> list =
                                        state.pedometerList.fold<List<PedometerModel>>([], (previousVal, element) {
                                      if (previousVal.isEmpty) {
                                        return [element];
                                      } else {
                                        final DateTime? previousDate = previousVal.first.date?.toDateTimeForHealth;
                                        final DateTime? thisDate = element.date?.toDateTimeForHealth;
                                        if (previousDate != null && thisDate != null) {
                                          if (thisDate.difference(previousDate).inDays > 0) {
                                            return [element];
                                          } else if (thisDate.difference(previousDate).inDays == 0) {
                                            previousVal.add(element);
                                          }
                                        }
                                        return previousVal;
                                      }
                                    });
                                    num steps = 0;
                                    num hour = 0;
                                    num minutes = 0;
                                    num distance = 0;
                                    for (final PedometerModel val in list) {
                                      steps += val.stepCount ?? 0;
                                      distance += val.distance ?? 0;
                                      minutes += ((val.hour ?? 0) * 60) + (val.minutes ?? 0);
                                    }
                                    hour = minutes ~/ 60;
                                    minutes = minutes % 60;
                                    return PedometerWidget(
                                      onTap: () async {
                                        await Navigator.pushNamed(
                                          context,
                                          Routes.subHealth,
                                          arguments: SubHealthArgs(
                                            bloc: _bloc,
                                            type: SubHealthType.pedometer,
                                            subHealthList: List.generate(
                                              state.pedometerList.length,
                                              (index) => SubHealthModel.fromPedometer(
                                                state.pedometerList[index],
                                              ),
                                            ),
                                          ),
                                        );
                                        if (state.isUpdatedPedometer) {
                                          _bloc.add(const HealthEvent.updatedPedometerIsUpdated(isUpdate: false));
                                        }
                                      },
                                      // steps: state.stepsCount,
                                      steps: Platform.isIOS ? state.stepsCount : steps,
                                      hour: hour,
                                      minutes: minutes,
                                      distance: distance,
                                      date: list.first.date ?? '',
                                    );
                                  } else {
                                    return PedometerWidget(
                                      onTap: () async {
                                        await Navigator.pushNamed(
                                          context,
                                          Routes.subHealth,
                                          arguments: SubHealthArgs(
                                            bloc: _bloc,
                                            type: SubHealthType.pedometer,
                                            subHealthList: List.generate(
                                              state.pedometerList.length,
                                              (index) => SubHealthModel.fromPedometer(state.pedometerList[index]),
                                            ),
                                          ),
                                        );
                                        if (state.isUpdatedPedometer) {
                                          _bloc.add(const HealthEvent.updatedPedometerIsUpdated(isUpdate: false));
                                        }
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ),

                          /// **************************************
                          const SliverGap(16),
                          SliverPadding(
                            padding: AppUtils.kPaddingHorizontal16,
                            sliver: SliverToBoxAdapter(
                              child: BlocBuilder<HealthBloc, HealthState>(
                                buildWhen: (previous, current) => previous.twhList != current.twhList,
                                builder: (_, state) => state.twhList.isNotEmpty
                                    ? TemperatureWeightHeightWidget(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                            context,
                                            Routes.subHealth,
                                            arguments: SubHealthArgs(
                                              bloc: _bloc,
                                              type: SubHealthType.twh,
                                              subHealthList: List.generate(
                                                state.twhList.length,
                                                (index) => SubHealthModel.fromTemperatureWeightHeight(
                                                  state.twhList[index],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        bodyTemperature: state.twhList.first.bodyTemperature ?? 0,
                                        height: state.twhList.first.height ?? 0,
                                        weight: state.twhList.first.weight ?? 0,
                                        imt: state.twhList.first.averageBmi ?? 0,
                                        date: state.twhList.first.date ?? '',
                                      )
                                    : TemperatureWeightHeightWidget(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                            context,
                                            Routes.subHealth,
                                            arguments: SubHealthArgs(
                                              bloc: _bloc,
                                              type: SubHealthType.twh,
                                              subHealthList: List.generate(
                                                state.twhList.length,
                                                (index) => SubHealthModel.fromTemperatureWeightHeight(
                                                  state.twhList[index],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                          ),
                          const SliverGap(16),
                          SliverPadding(
                            padding: AppUtils.kPaddingHorizontal16,
                            sliver: SliverToBoxAdapter(
                              child: BlocBuilder<HealthBloc, HealthState>(
                                buildWhen: (previous, current) =>
                                    previous.arterialPressureList != current.arterialPressureList ||
                                    previous.isUpdatedArterialPressure != current.isUpdatedArterialPressure,
                                builder: (_, state) => state.arterialPressureList.isNotEmpty
                                    ? ArterialPressureWidget(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                            context,
                                            Routes.subHealth,
                                            arguments: SubHealthArgs(
                                              bloc: _bloc,
                                              type: SubHealthType.arterialPressure,
                                              subHealthList: List.generate(
                                                state.arterialPressureList.length,
                                                (index) => SubHealthModel.fromArterialPressure(
                                                    state.arterialPressureList[index]),
                                              ),
                                            ),
                                          );
                                          debugPrint('dldl: ${state.isUpdatedArterialPressure}');
                                          if (state.isUpdatedArterialPressure) {
                                            _bloc.add(
                                              const HealthEvent.updatedrterialPressureIsUpdated(
                                                isUpdate: false,
                                              ),
                                            );
                                          }
                                        },
                                        pressure:
                                            '${state.arterialPressureList.first.sistolicheskoe ?? 0}/${state.arterialPressureList.first.diastolicheskoe ?? 0}',
                                        pulse: state.arterialPressureList.first.pulse ?? 0,
                                        date: state.arterialPressureList.first.date ?? '',
                                      )
                                    : ArterialPressureWidget(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                            context,
                                            Routes.subHealth,
                                            arguments: SubHealthArgs(
                                              bloc: _bloc,
                                              type: SubHealthType.arterialPressure,
                                              subHealthList: List.generate(
                                                state.arterialPressureList.length,
                                                (index) => SubHealthModel.fromArterialPressure(
                                                    state.arterialPressureList[index]),
                                              ),
                                            ),
                                          );
                                          debugPrint('dldl: ${state.isUpdatedArterialPressure}');
                                          if (state.isUpdatedArterialPressure) {
                                            _bloc.add(
                                                const HealthEvent.updatedrterialPressureIsUpdated(isUpdate: false));
                                          }
                                        },
                                      ),
                              ),
                            ),
                          ),
                          const SliverGap(16),
                          SliverPadding(
                            padding: AppUtils.kPaddingHorizontal16,
                            sliver: SliverToBoxAdapter(
                              child: BlocBuilder<HealthBloc, HealthState>(
                                buildWhen: (previous, current) => previous.bloodSugarList != current.bloodSugarList,
                                builder: (_, state) => state.bloodSugarList.isNotEmpty
                                    ? BloodSugarWidget(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                            context,
                                            Routes.subHealth,
                                            arguments: SubHealthArgs(
                                              bloc: _bloc,
                                              type: SubHealthType.bloodSugar,
                                              subHealthList: List.generate(
                                                state.bloodSugarList.length,
                                                (index) => SubHealthModel.fromBloodSugar(state.bloodSugarList[index]),
                                              ),
                                            ),
                                          );
                                        },
                                        bloodSugar: state.bloodSugarList.first.value ?? 0,
                                        date: state.bloodSugarList.first.date ?? '',
                                      )
                                    : BloodSugarWidget(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                            context,
                                            Routes.subHealth,
                                            arguments: SubHealthArgs(
                                              bloc: _bloc,
                                              type: SubHealthType.bloodSugar,
                                              subHealthList: List.generate(
                                                state.bloodSugarList.length,
                                                (index) => SubHealthModel.fromBloodSugar(state.bloodSugarList[index]),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                          ),
                          const SliverGap(16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
}
