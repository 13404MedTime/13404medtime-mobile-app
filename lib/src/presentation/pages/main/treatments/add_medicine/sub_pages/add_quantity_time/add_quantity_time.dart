import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../bloc/add_medicine/add_medicine_bloc.dart';
import '../../../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import 'widgets/add_time_widget.dart';
import 'widgets/bottom_sheet/add_time_medicine.dart';
import 'widgets/bottom_sheet/change_dosage_medicine.dart';
import 'widgets/bottom_sheet/change_quantity_medicine.dart';
import 'widgets/bottom_sheet/change_time_medicine.dart';
import 'widgets/current_stocks.dart';
import 'widgets/dosage_widget.dart';
import 'widgets/radio_button_widget.dart';
import 'widgets/show_time_widget.dart';

class AddQuantityAndTimePage extends StatefulWidget {
  const AddQuantityAndTimePage({super.key});

  @override
  State<AddQuantityAndTimePage> createState() => _AddQuantityAndTimePageState();
}

class _AddQuantityAndTimePageState extends State<AddQuantityAndTimePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.color.disabledCard,
                        ),
                        borderRadius: AppUtils.kBorderRadius8,
                      ),
                      child: Padding(
                        padding: AppUtils.kPaddingAll16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.translate('several_times_day'),
                              style: context.textStyle.regularCallout.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppUtils.kBoxHeight16,
                            BlocBuilder<AddMedicineBloc, AddMedicineState>(
                              buildWhen: (previous, current) =>
                                  previous.medicineTakeHourMinute != current.medicineTakeHourMinute,
                              builder: (context, state) => Column(
                                children: List.generate(
                                  state.medicineTakeHourMinute.isNotEmpty
                                      ? state.medicineTakeHourMinute.length.doubleTheListCount
                                      : 0,
                                  (index) => index.isEven
                                      ? ShowTimeWidget(
                                          isDeleteVisible: state.medicineTakeHourMinute.length > 1,
                                          time: state.medicineTakeHourMinute[index.exactIndex],
                                          onChangeTimeTap: () async {
                                            final result = await customModalBottomSheet<String>(
                                              context: context,
                                              builder: (_, controller) => ChangeTimeMedicineBottomSheet(
                                                initialItem: state.medicineTakeHourMinute[index.exactIndex],
                                              ),
                                            );
                                            if (result != null) {
                                              // ignore: use_build_context_synchronously
                                              context.read<AddMedicineBloc>().add(
                                                    UpdateMedicineTakeHourMinuteEvent(
                                                      medicineTakeHourMinute: result,
                                                      index: index.exactIndex,
                                                    ),
                                                  );
                                            }
                                          },
                                          onDeleteTimeTap: () {
                                            context.read<AddMedicineBloc>().add(
                                                  DeleteMedicineTakeHourMinuteEvent(
                                                    medicineTakeHourMinute:
                                                        state.medicineTakeHourMinute[index.exactIndex],
                                                  ),
                                                );
                                          },
                                        )
                                      : AppUtils.kBoxHeight8,
                                ),
                              ),
                            ),
                            AppUtils.kBoxHeight10,
                            AddTimeWidget(
                              onTap: () async {
                                final result = await customModalBottomSheet<String>(
                                  context: context,
                                  builder: (_, controller) => const AddTimeMedicineBottomSheet(),
                                );
                                if (result != null) {
                                  // ignore: use_build_context_synchronously
                                  context.read<AddMedicineBloc>().add(
                                        SetMedicineTakeHourMinuteEvent(
                                          medicineTakeHourMinute: result,
                                        ),
                                      );
                                }
                              },
                            ),
                            AppUtils.kBoxHeight10,
                            BlocBuilder<AddMedicineBloc, AddMedicineState>(
                              buildWhen: (previous, current) => previous.medicineDosage != current.medicineDosage,
                              builder: (context, state) => DosageWidget(
                                typeMedicine:
                                    state.metrics[state.metricIndex!].getName(num.tryParse(state.medicineDosage) ?? 1),
                                onTap: () {
                                  customModalBottomSheet<void>(
                                    height: 380,
                                    context: context,
                                    builder: (_, controller) => BlocProvider.value(
                                      value: BlocProvider.of<AddMedicineBloc>(context),
                                      child: ChangeDosageMedicineBottomSheet(
                                        initialItem: double.parse(state.medicineDosage),
                                      ),
                                    ),
                                  );
                                },
                                currentDosage: state.medicineDosage,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppUtils.kBoxHeight16,
                    BlocSelector<AddMedicineBloc, AddMedicineState, MedicineWeekdayStatus?>(
                      selector: (state) => state.medicineWeekdayStatus,
                      builder: (_, medicineWeekdayStatus) => !(medicineWeekdayStatus?.isAllDays ?? false)
                          ? Text(
                              context.translate('current_stocks'),
                              style: context.textStyle.regularCallout.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : AppUtils.kBox,
                    ),
                    BlocSelector<AddMedicineBloc, AddMedicineState, MedicineWeekdayStatus?>(
                      selector: (state) => state.medicineWeekdayStatus,
                      builder: (_, medicineWeekdayStatus) =>
                          !(medicineWeekdayStatus?.isAllDays ?? false) ? AppUtils.kBoxHeight8 : AppUtils.kBox,
                    ),
                    BlocBuilder<AddMedicineBloc, AddMedicineState>(
                      buildWhen: (previous, current) =>
                          previous.medicineQuantity != current.medicineQuantity ||
                          previous.medicineWeekdayStatus != current.medicineWeekdayStatus,
                      builder: (context, state) => !(state.medicineWeekdayStatus?.isAllDays ?? false)
                          ? CurrentStocksWidget(
                              typeMedicine:
                                  state.metrics[state.metricIndex!].getName(num.tryParse(state.medicineQuantity) ?? 1),
                              onTap: () {
                                customModalBottomSheet<void>(
                                  height: 380,
                                  context: context,
                                  builder: (_, controller) => BlocProvider.value(
                                    value: BlocProvider.of<AddMedicineBloc>(context),
                                    child: ChangeQuantityMedicineBottomSheet(
                                      initialItem: int.parse(
                                        state.medicineQuantity,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              currentStocks: state.medicineQuantity,
                            )
                          : AppUtils.kBox,
                    ),
                    AppUtils.kBoxHeight20,
                    BlocBuilder<AddMedicineBloc, AddMedicineState>(
                      buildWhen: (previous, current) => previous.timeTakeMedicine != current.timeTakeMedicine,
                      builder: (context, state) => Column(
                        children: [
                          RadioButtonWidget(
                            onTap: (value) {
                              context.read<AddMedicineBloc>().add(
                                    const SetTimeTakeMedicineEvent(
                                      timeTakeMedicine: 'beforeMeals',
                                    ),
                                  );
                            },
                            isChecked: state.timeTakeMedicine == 'beforeMeals',
                            title: context.translate('before_food'),
                          ),
                          AppUtils.kBoxHeight24,
                          RadioButtonWidget(
                            onTap: (value) {
                              context.read<AddMedicineBloc>().add(
                                    const SetTimeTakeMedicineEvent(
                                      timeTakeMedicine: 'whileEating',
                                    ),
                                  );
                            },
                            isChecked: state.timeTakeMedicine == 'whileEating',
                            title: context.translate('during_food'),
                          ),
                          AppUtils.kBoxHeight24,
                          RadioButtonWidget(
                            onTap: (value) {
                              context.read<AddMedicineBloc>().add(
                                    const SetTimeTakeMedicineEvent(
                                      timeTakeMedicine: 'afterMeals',
                                    ),
                                  );
                            },
                            isChecked: state.timeTakeMedicine == 'afterMeals',
                            title: context.translate('after_food'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: BlocBuilder<AddMedicineBloc, AddMedicineState>(
            builder: (context, state) => ElevatedButton(
              onPressed: () {
                if (!state.isLoading) {
                  context.read<AddMedicineBloc>().add(const SaveMedicationEvent());
                }
              },
              child: Text(
                context.translate('save'),
              ),
            ),
          ),
        ),
      );
}
