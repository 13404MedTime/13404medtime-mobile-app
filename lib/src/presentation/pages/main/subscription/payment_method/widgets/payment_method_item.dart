import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/home/payment_types/payment_types_response.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.onTap,
    required this.paymentItem,
  });

  final void Function() onTap;
  final PaymentItem paymentItem;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Ink(
          padding: AppUtils.kPaddingAll16,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            border: Border.all(
              color: context.color.onSurface20,
            ),
          ),
          child: Row(
            children: [
              Ink(
                padding: AppUtils.kPaddingHor16Ver8,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  border: Border.all(
                    color: context.color.onSurface20,
                  ),
                ),
                child: CachedNetworkImage(
                  height: 24,
                  width: 24,
                  imageUrl: paymentItem.image ?? '',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              AppUtils.kBoxWidth12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentItem.name ?? '',
                      style: context.textStyle.bodyBody.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppUtils.kBoxHeight8,
                    Text(
                      context.translate('pay_with').replaceFirst(
                            '#',
                            paymentItem.name ?? '',
                          ),
                      style: context.textStyle.lightBlackFontSize14Weight500.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.color.midGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
                color: context.color.onSurface20,
              ),
            ],
          ),
        ),
      );
}
