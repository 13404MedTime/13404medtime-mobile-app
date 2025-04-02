import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class TotalInfoCard extends StatelessWidget {
  const TotalInfoCard({
    super.key,
    required this.amount,
    required this.title,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) => Ink(
        padding: AppUtils.kPaddingAll12,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.theme.colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onSurface,
              ),
            )
          ],
        ),
      );
}
