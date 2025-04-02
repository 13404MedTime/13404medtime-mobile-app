import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';

class BuySubscriptionWidget extends StatelessWidget {
  const BuySubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingAll16,
        sliver: SliverToBoxAdapter(
          child: Ink(
            padding: AppUtils.kPaddingAll16,
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: Colors.white,
            ),
            child: Row(
              children: [
                Ink(
                  height: 40,
                  width: 40,
                  padding: AppUtils.kPaddingAll8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.background,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/ic_lock.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
                AppUtils.kBoxWidth8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.translate('additional_opportunities'),
                        style: context.textStyle.bodyFootnote.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.onBackground,
                        ),
                        maxLines: 2,
                      ),
                      AppUtils.kBoxHeight4,
                      Text(
                        context.translate('available_by_subscription'),
                        style: context.textStyle.regularCaption1.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.color.midGrey,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                AppUtils.kBoxWidth8,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.subscription,
                    );
                  },
                  child: Text(
                    context.translate('buy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
