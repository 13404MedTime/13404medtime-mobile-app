import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30,
        child: Row(
          children: [
            Text(
              title,
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
      );
}
