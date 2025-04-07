import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../args/sub_health_bottom_sheet_args.dart';

class HeightBottomSheet extends StatefulWidget {
  const HeightBottomSheet({super.key, this.args});

  final SubHealthBottomSheetArgs? args;

  @override
  State<HeightBottomSheet> createState() => _HeightBottomSheetState();
}

class _HeightBottomSheetState extends State<HeightBottomSheet> {
  late SubHealthBottomSheetArgs args = SubHealthBottomSheetArgs(
      height: widget.args?.height != null && widget.args!.height! <= 300 ? widget.args!.height! : 180);

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
                    context.translate('height'),
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
                    initialItem: args.height!,
                  ),
                  children: [
                    for (int i = 0; i <= 300; i++)
                      SizedBox(
                        height: 37,
                        child: Center(
                          child: Text(
                            '$i',
                            // style: const TextStyle(
                            //   fontSize: 24,
                            //   fontWeight: FontWeight.w500,
                            // ),
                          ),
                        ),
                      )
                  ],
                  onSelectedItemChanged: (i) {
                    args.height = i;
                    // pressure = i * 5;
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
