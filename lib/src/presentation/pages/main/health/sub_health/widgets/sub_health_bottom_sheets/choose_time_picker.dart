import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../args/sub_health_bottom_sheet_args.dart';

class ChooseTimePickerBottomSheetWidget extends StatefulWidget {
  const ChooseTimePickerBottomSheetWidget({super.key, this.args});

  final SubHealthBottomSheetArgs? args;

  @override
  State<ChooseTimePickerBottomSheetWidget> createState() => _ChooseTimePickerBottomSheetWidgetState();
}

class _ChooseTimePickerBottomSheetWidgetState extends State<ChooseTimePickerBottomSheetWidget> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
      checkedHour:
          widget.args?.checkedHour != null && (widget.args?.checkedHour ?? 12) <= 23 ? widget.args!.checkedHour! : 12,
      checkedMinute: widget.args?.checkedMinute != null && widget.args!.checkedMinute! <= 55
          ? widget.args!.checkedMinute! - (widget.args!.checkedMinute! % 5)
          : 30);

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
                    mainAxisSize: MainAxisSize.min,
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
                              initialItem: args.checkedHour ?? 12,
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
                              args.checkedHour = index;
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
                    mainAxisSize: MainAxisSize.min,
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
                              initialItem: (args.checkedMinute ?? 30) ~/ 5,
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
                              if (index * 5 != 0) {
                                args.checkedMinute = index * 5;
                              } else {
                                args.checkedMinute = 00;
                              }
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
