import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/home/subscription_types/subscription_types_response.dart';
import '../../../../../data/source/local_source.dart';
import '../../../../../injector_container.dart';
import 'subscription_feature_item.dart';

class SubscriptionItemWidget extends StatelessWidget {
  const SubscriptionItemWidget({
    super.key,
    required this.subscription,
  });

  final SubscriptionItem subscription;

  @override
  Widget build(BuildContext context) => Container(
        padding: AppUtils.kPaddingAll16,
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              subscription.subscriptionName ?? '',
              style: context.textStyle.lightBlackFontSize14Weight500.copyWith(
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurface,
              ),
            ),
            AppUtils.kBoxHeight4,
            Row(
              children: [
                Text(
                  '${(subscription.price ?? 0).moneyFormat} ${sl<LocalSource>().locale == 'uz' ? 'so\'m' : 'сум'} ',
                  style: context.textStyle.bodyHeadline.copyWith(
                    color: context.color.black24,
                  ),
                ),
                Text(
                  ' / ${subscription.afterPriceText ?? ''}',
                  style: context.textStyle.lightBlackFontSize14Weight500.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.color.black24,
                  ),
                ),
              ],
            ),
            AppUtils.kBoxHeight8,
            Text(
              subscription.description ?? '',
              style: context.textStyle.bodyFootnote.copyWith(
                color: context.color.midGrey,
              ),
              maxLines: 5,
            ),
            AppUtils.kBoxHeight8,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: context.color.transparent,
                highlightColor: Colors.red,
                splashColor: context.color.black,
              ),
              child: ExpansionTile(
                textColor: context.color.black,
                iconColor: context.color.midGrey,
                tilePadding: EdgeInsets.zero,
                title: Text(
                  context.translate('expand'),
                  style: context.textStyle.bodyFootnote,
                ),
                children: [
                  ...List.generate(
                    (subscription.consultationCount ?? 0) > 0
                        ? subscription.features?.length ?? 0 + 1
                        : subscription.features?.length ?? 0,
                    (index) => SubscriptionFeatureItem(
                      feature: subscription.features?[index] ?? '',
                      consultationDays: subscription.consultationCount ?? 0,
                      hasConsultationDays: (subscription.consultationCount ?? 0) > 0,
                      isLastIndex: index == (subscription.features?.length ?? 0) - 1,
                    ),
                  ),
                ],
              ),
            ),
            AppUtils.kBoxHeight8,
            ElevatedButton(
              onPressed: subscription.endDate?.isNotEmpty ?? false
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        Routes.paymentMethods,
                        arguments: PaymentMethodsPageArgument(
                          subscriptionId: subscription.guid ?? '',
                          subscriptionName: subscription.subscriptionName ?? '',
                          subscriptionPrice: subscription.price ?? 0,
                          afterPriceText: subscription.afterPriceText ?? '',
                          features: subscription.features ?? [],
                          consultationCounts: subscription.consultationCount ?? 0,
                        ),
                      );
                    },
              child: Text(
                context.translate('buy_subscription'),
              ),
            ),
            AppUtils.kBoxHeight8,
            if (subscription.endDate?.isNotEmpty ?? false)
              Text(
                context.translate('deadline_subscription').replaceAll(
                      '#',
                      (subscription.endDate ?? '').ddMMyyyy,
                    ),
                style: context.textStyle.lightBlackFontSize14Weight500.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.color.onBackground50,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      );
}
