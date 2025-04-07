import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/source/local_source.dart';
import '../../../../../injector_container.dart';

class PermissionAppBar extends StatelessWidget implements PreferredSizeWidget {
  PermissionAppBar({
    required this.title,
    this.onTap,
    super.key,
  }) : preferredSize = Size(double.infinity, Platform.isIOS ? 168 : 206);

  final String title;
  final void Function()? onTap;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          title,
          style: context.textStyle.appBarTitle,
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppUtils.kBoxHeight20,
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/${Platform.isIOS ? 'apple_health_logo' : 'google_fit_logo'}.svg'),
                    AppUtils.kBoxWidth10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.translate(
                              Platform.isIOS
                                  ? 'no_permission_for_apple_health_data'
                                  : sl<LocalSource>().isGoogleFitInstalled
                                      ? 'registration_google_fit'
                                      : 'install_google_fit',
                            ),
                            style: context.textStyle.buttonStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppUtils.kBoxHeight4,
                          Text(
                            context.translate(
                              Platform.isIOS
                                  ? 'no_permission_body_for_apple_health'
                                  : sl<LocalSource>().isGoogleFitInstalled
                                      ? 'registration_google_fit_body'
                                      : 'installation_dialog_body',
                            ),
                            maxLines: 5,
                            style: context.textStyle.bodyCaption2.copyWith(
                              color: context.color.darkGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                AppUtils.kBoxHeight12,
                if (!Platform.isIOS)
                  ElevatedButton(
                    onPressed: onTap,
                    child: Text(
                      sl<LocalSource>().isGoogleFitInstalled
                          ? context.translate('register')
                          : context.translate('install'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
