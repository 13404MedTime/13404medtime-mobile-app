import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';
import '../choose_date_picker.dart';
import '../choose_time_picker.dart';
import 'heart_pulse_bottom_sheet.dart';
import 'pressure_measure_bottom_sheet.dart';

class PressureBottomSheetWidget extends StatefulWidget {
  const PressureBottomSheetWidget({super.key});

  @override
  State<PressureBottomSheetWidget> createState() => _PressureBottomSheetWidgetState();
}

class _PressureBottomSheetWidgetState extends State<PressureBottomSheetWidget> {
  bool saveButtonClicked = false;
  SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
    date: DateTime.now().copyWith(hour: 0, minute: 0, second: 0),
    checkedData: DateTime.now().formatDate,
    checkedHour: DateTime.now().hour,
    checkedMinute: DateTime.now().minute,
  );

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppUtils.kBoxHeight24,
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Text(
                    context.translate('pressure'),
                    style: context.textStyle.appBarTitle,
                  ),
                  AppUtils.kSpacer,
                  InkWell(
                    borderRadius: AppUtils.kBorderRadius50,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: context.color.disabledCard,
                        shape: BoxShape.circle,
                      ),
                      padding: AppUtils.kPaddingAll6,
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppUtils.kBoxHeight32,

            /// [pressure]
            SizedBox(
              // height: 52,
              child: Row(
                children: [
                  Text(
                    context.translate('pressure'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppUtils.kSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          border: (saveButtonClicked && (args.sistolicheskoe == null || args.diastolicheskoe == null))
                              ? Border.all(color: context.theme.colorScheme.error)
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                              context: context,
                              builder: (_, controller) => PressureMeasureBottomSheetWidget(args: args),
                            );
                            if (result is SubHealthBottomSheetArgs) {
                              args.copyWithOther(result);
                              setState(() {});
                            }
                          },
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius8,
                            child: ColoredBox(
                              color: context.theme.colorScheme.background,
                              child: SizedBox(
                                width: 207,
                                height: 52,
                                child: args.sistolicheskoe != null && args.diastolicheskoe != null
                                    ? Center(
                                        child: Text(
                                          '${args.sistolicheskoe}/${args.diastolicheskoe} ${context.translate('mmhg')}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      (saveButtonClicked && (args.sistolicheskoe == null || args.diastolicheskoe == null))
                          ? Center(
                              child: Text(
                                context.translate('must_field'),
                                style: TextStyle(
                                  color: context.theme.colorScheme.error,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kBoxHeight16,

            /// [heart_rate]
            SizedBox(
              // height: 52,
              child: Row(
                children: [
                  Text(
                    context.translate('heart_rate'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppUtils.kSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          border: (saveButtonClicked && args.pulse == null)
                              ? Border.all(color: context.theme.colorScheme.error)
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                              context: context,
                              builder: (_, controller) => HeartPulseBottomSheetWidget(args: args),
                            );
                            if (result is SubHealthBottomSheetArgs) {
                              args.copyWithOther(result);
                              setState(() {});
                            }
                          },
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius8,
                            child: ColoredBox(
                              color: context.theme.colorScheme.background,
                              child: SizedBox(
                                width: 207,
                                height: 52,
                                child: args.pulse != null
                                    ? Center(
                                        child: Text(
                                          '${args.pulse} ${context.translate('beats_min')}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      (saveButtonClicked && args.pulse == null)
                          ? Center(
                              child: Text(
                                context.translate('must_field'),
                                style: TextStyle(
                                  color: context.theme.colorScheme.error,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  )
                ],
              ),
            ),
            AppUtils.kBoxHeight16,

            /// [date]
            SizedBox(
              child: Row(
                children: [
                  Text(
                    context.translate('date'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppUtils.kSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          border: (saveButtonClicked && (args.checkedData == null))
                              ? Border.all(
                                  color: context.theme.colorScheme.error,
                                )
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await customModalBottomSheet<dynamic>(
                              context: context,
                              builder: (_, controller) => ChooseDatePickerBottomSheetWidget(args: args),
                            );
                            if (result is SubHealthBottomSheetArgs) {
                              args.copyWithOther(result);
                              setState(() {});
                            }
                          },
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius8,
                            child: ColoredBox(
                              color: context.theme.colorScheme.background,
                              child: SizedBox(
                                width: 207,
                                height: 52,
                                child: args.checkedData != null
                                    ? Center(
                                        child: Text(
                                          '${args.checkedData}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      (saveButtonClicked && (args.checkedData == null))
                          ? Center(
                              child: Text(
                                context.translate('must_field'),
                                style: TextStyle(
                                  color: context.theme.colorScheme.error,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kBoxHeight16,

            /// [time]
            SizedBox(
              child: Row(
                children: [
                  Text(
                    context.translate('time'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppUtils.kSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          border: (saveButtonClicked && (args.checkedHour == null && args.checkedHour == null))
                              ? Border.all(color: context.theme.colorScheme.error)
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            // ignore: inference_failure_on_function_invocation
                            final result = await customModalBottomSheet(
                              context: context,
                              builder: (_, controller) => ChooseTimePickerBottomSheetWidget(
                                args: args,
                              ),
                            );
                            if (result is SubHealthBottomSheetArgs) {
                              args.copyWithOther(result);
                              setState(() {});
                            }
                          },
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius8,
                            child: ColoredBox(
                              color: context.theme.colorScheme.background,
                              child: SizedBox(
                                width: 207,
                                height: 52,
                                child: args.checkedHour != null && args.checkedMinute != null
                                    ? Center(
                                        child: Text(
                                          '${args.checkedHour!.toString().padLeft(2, '0')}:${args.checkedMinute!.toString().padLeft(2, '0')}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      (saveButtonClicked && (args.checkedHour == null && args.checkedMinute == null))
                          ? Center(
                              child: Text(
                                context.translate('must_field'),
                                style: TextStyle(
                                  color: context.theme.colorScheme.error,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kBoxHeight32,

            /// [heart_rate]
            ElevatedButton(
              onPressed: () {
                if (!saveButtonClicked) {
                  saveButtonClicked = true;
                  setState(() {});
                }
                if (args.sistolicheskoe != null &&
                    args.diastolicheskoe != null &&
                    args.pulse != null &&
                    args.checkedData != null &&
                    args.checkedHour != null &&
                    args.checkedMinute != null) {
                  Navigator.pop(context, args);
                }
              },
              child: Text(context.translate('save')),
            ),
            AppUtils.kBoxHeight24,
          ],
        ),
      );
}
