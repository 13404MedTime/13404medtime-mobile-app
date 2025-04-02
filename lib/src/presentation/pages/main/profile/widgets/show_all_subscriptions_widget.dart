import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';

class ShowAllSubscriptionsWidget extends StatelessWidget {
  const ShowAllSubscriptionsWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.subscription,
            );
          },
          child: Ink(
            padding: AppUtils.kPaddingAll16,
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: Colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/buy_subscription.svg',
                  height: 28,
                  width: 28,
                ),
                AppUtils.kBoxWidth12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate('buy_subscription'),
                      style: context.textStyle.regularBody.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AppUtils.kBoxHeight4,
                    Text(
                      context.translate('you_need_choose_subscription'),
                      style: context.textStyle.bodyFootnote.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                AppUtils.kSpacer,
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: context.theme.colorScheme.onSurface,
                )
              ],
            ),
          ),
        ),
      );
}
