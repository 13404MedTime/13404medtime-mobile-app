import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';

class TimePickerBottomSheetWidget extends StatefulWidget {
  const TimePickerBottomSheetWidget({this.args, super.key});

  final SubHealthBottomSheetArgs? args;

  @override
  State<TimePickerBottomSheetWidget> createState() => _TimePickerBottomSheetWidgetState();
}

class _TimePickerBottomSheetWidgetState extends State<TimePickerBottomSheetWidget> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
      hour: widget.args?.hour != null && (widget.args?.hour ?? 12) <= 23 ? widget.args!.hour! : 0,
      minutes: widget.args?.minutes != null && widget.args!.minutes! <= 55
          ? widget.args!.minutes! - (widget.args!.minutes! % 5)
          : 0);

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
                    context.translate('time'),
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        context.translate('hour2'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      AppUtils.kBoxHeight12,
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: AppUtils.kBorderRadius8,
                          child: CupertinoPicker(
                            backgroundColor: context.theme.colorScheme.background,
                            itemExtent: 37,
                            squeeze: 1,
                            scrollController: FixedExtentScrollController(
                              initialItem: args.hour ?? 12,
                            ),
                            children: [
                              for (int i = 0; i < 24; i++)
                                SizedBox(
                                  height: 37,
                                  child: Center(
                                    child: Text(i.toString().padLeft(2, '0')),
                                  ),
                                )
                            ],
                            onSelectedItemChanged: (index) {
                              args.hour = index;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppUtils.kBoxWidth24,
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        context.translate('min2'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      AppUtils.kBoxHeight12,
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: AppUtils.kBorderRadius8,
                          child: CupertinoPicker(
                            backgroundColor: context.theme.colorScheme.background,
                            itemExtent: 37,
                            squeeze: 1,
                            scrollController: FixedExtentScrollController(
                              initialItem: (args.minutes ?? 30) ~/ 5,
                            ),
                            children: List.generate(
                              12,
                              (i) => SizedBox(
                                height: 37,
                                child: Center(
                                  child: Text('${i * 5}'.padLeft(2, '0')),
                                ),
                              ),
                            ),
                            onSelectedItemChanged: (index) {
                              args.minutes = index * 5;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppUtils.kBoxHeight32,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, args);
              },
              child: Text(context.translate('save')),
            ),
            AppUtils.kBoxHeight24,
          ],
        ),
      );
}
