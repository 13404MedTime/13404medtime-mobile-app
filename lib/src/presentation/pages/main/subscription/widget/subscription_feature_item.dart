import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class SubscriptionFeatureItem extends StatelessWidget {
  const SubscriptionFeatureItem({
    super.key,
    required this.feature,
    required this.consultationDays,
    required this.hasConsultationDays,
    required this.isLastIndex,
  });

  final String feature;
  final num consultationDays;
  final bool hasConsultationDays;
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingBottom12,
        child: Row(
          children: [
            Icon(
              hasConsultationDays && isLastIndex ? Icons.add : Icons.check,
              size: hasConsultationDays && isLastIndex ? 20 : 16,
              color: hasConsultationDays && isLastIndex ? context.colorScheme.primary : context.color.midGrey,
            ),
            AppUtils.kBoxWidth8,
            Text(
              hasConsultationDays && isLastIndex
                  ? '$consultationDays ${feature.replaceFirst('+', '').trim()}'
                  : feature,
              style: context.textStyle.bodyFootnote.copyWith(
                color: hasConsultationDays && isLastIndex ? context.colorScheme.primary : context.color.midGrey,
              ),
            ),
          ],
        ),
      );
}
