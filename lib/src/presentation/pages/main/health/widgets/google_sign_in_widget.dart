import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/extension/extension.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({
    super.key,
    required this.onTapSignIn,
  });

  final void Function() onTapSignIn;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/ic_google_icon_logo.svg',
            height: 120,
            width: 120,
          ),
          AppUtils.kBoxHeight16,
          Center(
            child: Text(
              'Welcome to Google Authentication.',
              style: context.textStyle.lightBlackFontSize14Weight500,
            ),
          ),
          AppUtils.kBoxHeight4,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Center(
              child: Text(
                'You should google sign in for getting Google Fit health info!',
                style: context.textStyle.lightBlackFontSize14Weight500,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppUtils.kBoxHeight34,
          Padding(
            padding: AppUtils.kPaddingHor32Ver20,
            child: ElevatedButton(
              onPressed: onTapSignIn,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_google_icon_logo.svg',
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Continue with Google',
                    style: context.textStyle.primary10FontSize14Weight700.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
