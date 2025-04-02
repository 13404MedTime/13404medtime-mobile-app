import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';

class DosageWidget extends StatelessWidget {
  const DosageWidget({
    super.key,
    required this.onTap,
    required this.currentDosage,
    required this.typeMedicine,
  });

  final VoidCallback onTap;
  final String currentDosage;
  final String typeMedicine;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius8,
        child: Ink(
          padding: AppUtils.kPaddingAll12,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.color.disabledCard,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.translate('dosage'),
                style: context.textStyle.regularCallout.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSurface,
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${(num.tryParse(currentDosage) ?? 0).formatNum} $typeMedicine',
                    style: context.textStyle.regularCallout.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.primary,
                      fontSize: 15,
                    ),
                  ),
                  AppUtils.kBoxWidth8,
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.theme.colorScheme.primary,
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
