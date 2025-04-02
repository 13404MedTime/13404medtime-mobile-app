import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../core/extension/extension.dart';

class ChangeTimeMedicineBottomSheet extends StatefulWidget {
  const ChangeTimeMedicineBottomSheet({super.key, required this.initialItem});

  final String initialItem;

  @override
  State<ChangeTimeMedicineBottomSheet> createState() => _ChangeTimeMedicineBottomSheetState();
}

class _ChangeTimeMedicineBottomSheetState extends State<ChangeTimeMedicineBottomSheet> {
  String? _hour;
  String? _minute;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                              initialItem: formatStringToHour(widget.initialItem),
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
                              _hour = formatNum(index);
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
                              initialItem: int.parse(widget.initialItem.substring(3, 5)) ~/ 5,
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
                              _minute = formatNum2(index).padLeft(2, '0');
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
                if (_hour == null && _minute == null) {
                  Navigator.pop(
                    context,
                    widget.initialItem,
                  );
                  return;
                }
                Navigator.pop(
                  context,
                  _hour == null
                      ? '${widget.initialItem.substring(0, 2)}:$_minute'
                      : _minute == null
                          ? '$_hour:${widget.initialItem.substring(3, 5)}'
                          : '$_hour:$_minute',
                );
              },
              child: Text(context.translate('save')),
            ),
          ],
        ),
      );
}

int formatStringToHour(String number) {
  if (number.substring(0, 2) == '00') {
    return 0;
  } else {
    return int.parse(number.substring(0, 2));
  }
}

String formatNum(int number) {
  if (number >= 0 && number <= 9) {
    return number.toString().padLeft(2, '0');
  }
  return number.toString();
}

String formatNum2(int number) {
  switch (number) {
    case 0:
      return '00';
    case 1:
      return '05';
    default:
      return (number * 5).toString();
  }
}
