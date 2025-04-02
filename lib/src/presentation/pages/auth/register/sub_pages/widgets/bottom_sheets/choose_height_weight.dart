import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';

// ignore: must_be_immutable
class ChoseHeightOrWeightBottomSheet extends StatelessWidget {
  ChoseHeightOrWeightBottomSheet({
    super.key,
    required this.sheetName,
    required this.isHeight,
    this.value,
  }) {
    _checkedHeightOrWeight = value ?? (isHeight ? '165' : '70');
  }

  late String _checkedHeightOrWeight;
  final String? value;
  final String sheetName;
  final bool isHeight;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppUtils.kGap8,
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Text(
                    sheetName,
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
                child: RotatedBox(
                  quarterTurns: 3,
                  child: CupertinoPicker(
                    backgroundColor: context.theme.colorScheme.surface,
                    itemExtent: 55,
                    squeeze: 1,
                    scrollController: FixedExtentScrollController(
                      // initialItem: isHeight ? 165 ~/ 0.5 : 60 ~/ 0.5,
                      initialItem: ((num.tryParse(_checkedHeightOrWeight) ?? 0.5) ~/ 0.5) - (isHeight ? 130 : 20),
                    ),
                    children: [
                      for (int i = (isHeight ? 130 : 20); i < (isHeight ? 441 : 321); i++)
                        RotatedBox(
                          quarterTurns: 1,
                          child: SizedBox(
                            height: 37,
                            child: Center(
                              child: Text((i / 2).formatNum),
                            ),
                          ),
                        )
                    ],
                    onSelectedItemChanged: (i) {
                      _checkedHeightOrWeight = ((i + (isHeight ? 130 : 20)) / 2).toString();
                    },
                  ),
                ),
              ),
            ),
            AppUtils.kBoxHeight32,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _checkedHeightOrWeight);
              },
              child: Text(context.translate('save')),
            ),
          ],
        ),
      );
}
