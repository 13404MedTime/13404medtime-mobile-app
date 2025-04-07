import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';

class HeartPulseBottomSheetWidget extends StatefulWidget {
  const HeartPulseBottomSheetWidget({super.key, this.args});

  final SubHealthBottomSheetArgs? args;

  @override
  State<HeartPulseBottomSheetWidget> createState() => _HeartPulseBottomSheetWidgetState();
}

class _HeartPulseBottomSheetWidgetState extends State<HeartPulseBottomSheetWidget> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
      pulse: widget.args?.pulse != null && widget.args!.pulse! <= 150 ? widget.args!.pulse! : 60);

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
                    context.translate('heart_rate'),
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
                  squeeze: 1,
                  scrollController: FixedExtentScrollController(
                    initialItem: args.pulse! - 1,
                  ),
                  children: [
                    for (int i = 0; i < 150; i++)
                      SizedBox(
                        height: 37,
                        child: Center(
                          child: Text('${i + 1}'),
                        ),
                      )
                  ],
                  onSelectedItemChanged: (i) {
                    args.pulse = i + 1;
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
