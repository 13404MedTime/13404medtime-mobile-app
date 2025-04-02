import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/extension/extension.dart';

// ignore: must_be_immutable
class ChoseBloodGroupBottomSheet extends StatelessWidget {
  ChoseBloodGroupBottomSheet({
    super.key,
  });

  String _checkedHeightOrWeight = 'AB+';

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
                    context.translate('blood_type'),
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
            Expanded(
              child: ClipRRect(
                borderRadius: AppUtils.kBorderRadius8,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: CupertinoPicker(
                    backgroundColor: context.theme.colorScheme.surface,
                    itemExtent: 55,
                    squeeze: 1,
                    scrollController: FixedExtentScrollController(
                      initialItem: 4,
                    ),
                    children: [
                      for (int i = 0; i < bloodGroups.length; i++)
                        RotatedBox(
                          quarterTurns: 1,
                          child: SizedBox(
                            height: 55,
                            child: Center(
                              child: Text(bloodGroups[i]),
                            ),
                          ),
                        )
                    ],
                    onSelectedItemChanged: (i) {
                      _checkedHeightOrWeight = bloodGroups[i];
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
