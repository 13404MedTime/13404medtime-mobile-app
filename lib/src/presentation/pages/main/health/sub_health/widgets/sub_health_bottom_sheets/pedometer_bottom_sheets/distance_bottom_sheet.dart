import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';

class DistanceBottomSheetWidget extends StatefulWidget {
  const DistanceBottomSheetWidget({super.key, this.args});

  final SubHealthBottomSheetArgs? args;

  @override
  State<DistanceBottomSheetWidget> createState() => _DistanceBottomSheetWidgetState();
}

class _DistanceBottomSheetWidgetState extends State<DistanceBottomSheetWidget> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
    distance: widget.args?.distance != null && ((widget.args?.distance ?? 10) <= 30) ? widget.args!.distance! : 10,
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
                    context.translate('kilometers2'),
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
                    initialItem: (args.distance ?? 10) ~/ 0.5,
                  ),
                  children: [
                    for (int i = 0; i < 61; i++)
                      SizedBox(
                        height: 37,
                        child: Center(
                          child: Text('${(i / 2).formatNum} ${context.translate('km')}'),
                        ),
                      )
                  ],
                  onSelectedItemChanged: (i) {
                    args.distance = i / 2;
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
