import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../config/router/routes_arguments.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/source/local_source.dart';
import '../../../../../../injector_container.dart';
import '../../../../../bloc/main/main_bloc.dart';
import '../../widget/subscription_feature_item.dart';

class ShowSubscriptionDetailsBottomSheet extends StatelessWidget {
  const ShowSubscriptionDetailsBottomSheet({
    super.key,
    required this.subscription,
  });

  final PaymentMethodsPageArgument? subscription;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.translate('subscription_details'),
                  style: context.textStyle.regularHeadline,
                ),
                InkWell(
                  onTap: () {
                    context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.main,
                      (route) => false,
                    );
                  },
                  child: Ink(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.color.onSurface20,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            AppUtils.kBoxHeight36,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(subscription?.subscriptionPrice ?? 0).moneyFormat} ${sl<LocalSource>().locale == 'uz' ? 'so\'m' : 'сум'} ',
                  style: context.textStyle.blackFontSize24Weight600.copyWith(
                    color: context.color.black24,
                  ),
                ),
                Text(
                  ' / ${subscription?.afterPriceText ?? ''}',
                  style: context.textStyle.primary10FontSize14Weight700.copyWith(
                    color: context.color.black24,
                  ),
                ),
              ],
            ),
            AppUtils.kBoxHeight16,
            Text(
              context.translate('success_payment_body').replaceFirst(
                    '#',
                    subscription?.subscriptionName ?? '',
                  ),
              style: context.textStyle.bodyFootnote.copyWith(
                color: context.color.black24,
              ),
              maxLines: 8,
              textAlign: TextAlign.center,
            ),
            AppUtils.kBoxHeight36,
            Ink(
                padding: AppUtils.kPaddingAll10,
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius16,
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    subscription?.features.length ?? 0,
                    (index) => SubscriptionFeatureItem(
                      feature: subscription?.features[index] ?? '',
                      consultationDays: subscription?.consultationCounts ?? 0,
                      hasConsultationDays: (subscription?.consultationCounts ?? 0) > 0,
                      isLastIndex: index == (subscription?.features.length ?? 0) - 1,
                    ),
                  ),
                )),
            AppUtils.kBoxHeight42,
            ElevatedButton(
              onPressed: () {
                context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.main,
                  (route) => false,
                );
              },
              child: Text(
                context.translate('ready'),
              ),
            ),
          ],
        ),
      );
}
