import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';
import '../choose_date_picker.dart';
import '../choose_time_picker.dart';
import 'distance_bottom_sheet.dart';
import 'time_picker_bottom_sheet.dart';

class PedometerBottomSheetWidget extends StatefulWidget {
  const PedometerBottomSheetWidget({super.key});

  @override
  State<PedometerBottomSheetWidget> createState() => _PedometerBottomSheetWidgetState();
}

class _PedometerBottomSheetWidgetState extends State<PedometerBottomSheetWidget> {
  bool saveButtonClicked = false;
  final TextEditingController stepsController = TextEditingController();
  final FocusNode stepsNode = FocusNode();
  SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
    date: DateTime.now().copyWith(hour: 0, minute: 0, second: 0),
    checkedData: DateTime.now().formatDate,
    checkedHour: DateTime.now().hour,
    checkedMinute: DateTime.now().minute,
  );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
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
                      context.translate('pedometer'),
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

              /// [pedometer]
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      context.translate('passed'),
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
                            border: (saveButtonClicked && (args.hour == null && args.minutes == null))
                                ? Border.all(color: context.theme.colorScheme.error)
                                : null,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              stepsNode.unfocus();
                              // ignore: inference_failure_on_function_invocation
                              final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                                context: context,
                                builder: (_, controller) => TimePickerBottomSheetWidget(args: args),
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
                                  child: args.hour != null && args.minutes != null
                                      ? Center(
                                          child: Text(
                                            '${args.hour} ${context.translate('hour')} ${args.minutes} ${context.translate('min')}',
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
                        (saveButtonClicked && (args.hour == null && args.minutes == null))
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
                      context.translate('kilometers'),
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
                            border: (saveButtonClicked && (args.distance == null))
                                ? Border.all(color: context.theme.colorScheme.error)
                                : null,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              stepsNode.unfocus();
                              final result = await customModalBottomSheet<SubHealthBottomSheetArgs?>(
                                context: context,
                                builder: (_, controller) => DistanceBottomSheetWidget(args: args),
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
                                  child: args.distance != null
                                      ? Center(
                                          child: Text(
                                            '${args.distance!.formatNum} ${context.translate('km')}',
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
                        saveButtonClicked && args.distance == null
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

              /// [kilometers]
              SizedBox(
                // height: 52,
                child: Row(
                  children: [
                    Text(
                      context.translate('steps2'),
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
                            border: (saveButtonClicked && int.tryParse(stepsController.text) == null)
                                ? Border.all(color: context.theme.colorScheme.error)
                                : null,
                          ),
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius8,
                            child: ColoredBox(
                              color: context.theme.colorScheme.background,
                              child: SizedBox(
                                width: 207,
                                height: 52,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: 80,
                                      child: TextField(
                                        focusNode: stepsNode,
                                        controller: stepsController,
                                        cursorHeight: 18,
                                        cursorColor: context.theme.colorScheme.primary,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          TextInputFormatter.withFunction(
                                            (oldValue, newValue) => newValue.text.isEmpty ||
                                                    newValue.text.length < 7 && newValue.text.isNumber
                                                ? newValue
                                                : oldValue,
                                          ),
                                        ],
                                        decoration: const InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          contentPadding: AppUtils.kPadding0,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        (saveButtonClicked && int.tryParse(stepsController.text) == null)
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
                              stepsNode.unfocus();
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
                              stepsNode.unfocus();
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

              /// [save]
              ElevatedButton(
                onPressed: () {
                  if (!saveButtonClicked) {
                    saveButtonClicked = true;
                    setState(() {});
                  }
                  if (args.hour != null &&
                      args.minutes != null &&
                      args.distance != null &&
                      int.tryParse(stepsController.text) != null &&
                      args.checkedData != null &&
                      args.checkedHour != null &&
                      args.checkedMinute != null) {
                    args.stepCount = int.parse(stepsController.text);
                    Navigator.pop(
                      context,
                      args,
                    );
                  }
                },
                child: Text(context.translate('save')),
              ),
              AppUtils.kBoxHeight24,
            ],
          ),
        ),
      );
}
