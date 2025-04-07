import 'package:flutter/material.dart';

import '../../../../../../../../config/router/app_routes.dart';
import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';
import '../choose_date_picker.dart';
import '../choose_time_picker.dart';
import 'height_bottom_sheet.dart';
import 'temperature_bottom_sheet.dart';
import 'weight_bottom_sheet.dart';

class TemperatureWeightHeightBottomSheet extends StatefulWidget {
  const TemperatureWeightHeightBottomSheet({super.key});

  @override
  State<TemperatureWeightHeightBottomSheet> createState() => _TemperatureWeightHeightBottomSheetState();
}

class _TemperatureWeightHeightBottomSheetState extends State<TemperatureWeightHeightBottomSheet> {
  bool saveButtonClicked = false;

  SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
    // temperature: localSource.temperature,
    height: localSource.height,
    weight: localSource.weight,
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
                    '${context.translate('temp_weight_height')}, ${context.translate('bmi')}',
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

            /// [temperatura]
            SizedBox(
              // height: 65,
              child: Row(
                children: [
                  /// [temperatura title]
                  Text(
                    context.translate('temperature'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppUtils.kSpacer,

                  /// [temperatura field]
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                            borderRadius: AppUtils.kBorderRadius8,
                            border: (saveButtonClicked && args.temperature == null)
                                ? Border.all(color: context.theme.colorScheme.error)
                                : null),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                              context: context,
                              // isDismissible: false,
                              builder: (_, controller) => TemperatureBottomSheet(args: args),
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
                                child: Center(
                                  child: Text(
                                    args.temperature != null ? '${args.temperature!.moneyFormat} с°' : '',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      saveButtonClicked && args.temperature == null
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

            /// [weight]
            SizedBox(
              // height: 52,
              child: Row(
                children: [
                  /// [weight title]
                  Text(
                    context.translate('weight'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppUtils.kSpacer,

                  /// [temperatura field]
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          border: (saveButtonClicked && args.weight == null)
                              ? Border.all(color: context.theme.colorScheme.error)
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                              context: context,
                              builder: (_, controller) => WeightBottomSheet(args: args),
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
                                child: args.weight != null
                                    ? Center(
                                        child: Text(
                                          '${args.weight} ${context.translate('kg')}',
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
                      saveButtonClicked && args.weight == null
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

            /// [height]
            SizedBox(
              // height: 52,
              child: Row(
                children: [
                  Text(
                    context.translate('height'),
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
                          border: (saveButtonClicked && args.height == null)
                              ? Border.all(color: context.theme.colorScheme.error)
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                              context: context,
                              builder: (_, controller) => HeightBottomSheet(args: args),
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
                                child: args.height != null
                                    ? Center(
                                        child: Text(
                                          '${args.height} ${context.translate('sm')}',
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
                      saveButtonClicked && args.height == null
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

            /// [save button]
            ElevatedButton(
              onPressed: () {
                args.temperature ??= 36.6;
                if (!saveButtonClicked) {
                  saveButtonClicked = true;
                  setState(() {});
                }
                if (args.weight != null &&
                    args.height != null &&
                    args.checkedData != null &&
                    args.checkedHour != null &&
                    args.checkedMinute != null) {
                  if (args.height != null) localSource.setHeight(args.height!);
                  if (args.weight != null) localSource.setWeight(args.weight!);
                  if (args.temperature != null) {
                    localSource.setTemperature(args.temperature!);
                  }
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
