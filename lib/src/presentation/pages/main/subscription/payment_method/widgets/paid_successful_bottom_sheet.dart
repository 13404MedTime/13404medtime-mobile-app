import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../config/router/routes_arguments.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../bloc/main/main_bloc.dart';
import 'show_subscription_details_bottom_sheet.dart';

class PaidSuccessfulBottomSheet extends StatelessWidget {
  const PaidSuccessfulBottomSheet({
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
            SvgPicture.asset(
              'assets/svg/ic_check_circle.svg',
              height: 64,
              width: 64,
            ),
            AppUtils.kBoxHeight12,
            Text(
              context.translate('successful_paid'),
              style: context.textStyle.appBarTitle,
              textAlign: TextAlign.center,
            ),
            AppUtils.kBoxHeight8,
            Text(
              context.translate('success_payment_body').replaceFirst(
                    '#',
                    subscription?.subscriptionName ?? '',
                  ),
              style: context.textStyle.bodyFootnote.copyWith(
                fontWeight: FontWeight.w500,
                color: context.color.black,
              ),
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
            AppUtils.kBoxHeight12,
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
            AppUtils.kBoxHeight12,
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => context.color.disabledCard,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet<void>(
                  barrierColor: context.color.black.withOpacity(0.45),
                  isDismissible: false,
                  enableDrag: false,
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                    maxHeight: context.mediaQuery.size.height * 0.9,
                  ),
                  context: context,
                  builder: (_) => ShowSubscriptionDetailsBottomSheet(
                    subscription: subscription,
                  ),
                );
              },
              child: Text(
                context.translate('detailed'),
                style: context.textStyle.buttonStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
}
