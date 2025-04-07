import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';

class TemperatureBottomSheet extends StatefulWidget {
  const TemperatureBottomSheet({super.key, this.args});

  final SubHealthBottomSheetArgs? args;

  @override
  State<TemperatureBottomSheet> createState() => _TemperatureBottomSheetState();
}

class _TemperatureBottomSheetState extends State<TemperatureBottomSheet> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
      temperature: widget.args?.temperature != null && widget.args!.temperature! <= 40
          ? ((widget.args!.temperature! * 10) / 10)
          : 36.6);

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
                    context.translate('temperature'),
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
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: AppUtils.kBorderRadius8,
                child: CupertinoPicker(
                  backgroundColor: context.theme.colorScheme.background,
                  itemExtent: 37,
                  squeeze: 0.8,
                  diameterRatio: 1.7,
                  scrollController: FixedExtentScrollController(
                    initialItem: (args.temperature! * 10).toInt(),
                  ),
                  children: [
                    for (int i = 0; i < 401; i++)
                      SizedBox(
                        height: 37,
                        child: Center(
                          child: Text(
                            (i / 10).formatNum,
                          ),
                        ),
                      )
                  ],
                  onSelectedItemChanged: (i) {
                    args.temperature = i / 10;
                  },
                ),
              ),
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
