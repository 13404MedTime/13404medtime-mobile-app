import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';

class CurrentStocksWidget extends StatelessWidget {
  const CurrentStocksWidget({
    super.key,
    required this.onTap,
    required this.currentStocks,
    required this.typeMedicine,
  });

  final VoidCallback onTap;
  final String currentStocks;
  final String typeMedicine;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius8,
        child: Ink(
          padding: AppUtils.kPaddingAll12,
          decoration: BoxDecoration(
            color: context.color.disabledCard,
            borderRadius: AppUtils.kBorderRadius8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.translate('quantity'),
                style: context.textStyle.regularCallout.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSurface,
                  fontSize: 15,
                ),
              ),
              AppUtils.kSpacer,
              Text(
                '$currentStocks $typeMedicine',
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
        ),
      );
}
