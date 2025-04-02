import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../injector_container.dart';
import 'widgets/about_us_item.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.translate('contact_us'),
            style: context.theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: AppUtils.kPaddingAll12,
                padding: AppUtils.kPaddingAll12,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: AppUtils.kBorderRadius8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AboutUsItem(
                      coloredItem: false,
                      icon: AppIcons.mail,
                      onTap: () async {
                        await sendAnalyticsEvent(
                            tag: FirebaseAnalyticsEvents.callBtn, parameters: {'user_name': localSource.firstName});
                        final String email = Uri.encodeComponent('support@madadio.uz');
                        final String subject = Uri.encodeComponent('');
                        final String body = Uri.encodeComponent('');
                        final Uri mail = Uri.parse('mailto:$email?subject=$subject&body=$body');
                        await launchUrl(mail);
                      },
                      title: context.translate('support'),
                    ),
                    AppUtils.kBoxHeight8,
                    AboutUsItem(
                      coloredItem: false,
                      icon: AppIcons.instagram,
                      onTap: () async {
                        await sendAnalyticsEvent(
                          tag: FirebaseAnalyticsEvents.instagramBtn,
                          parameters: {'user_name': localSource.firstName},
                        );
                        await lounchUrlTo('https://www.instagram.com/madadio.uz/');
                      },
                      title: context.translate('instagram'),
                    ),
                    AppUtils.kBoxHeight8,
                    AboutUsItem(
                      coloredItem: false,
                      icon: AppIcons.telegram,
                      onTap: () async {
                        await sendAnalyticsEvent(
                          tag: FirebaseAnalyticsEvents.telegramBtn,
                          parameters: {'user_name': localSource.firstName},
                        );
                        await lounchUrlTo('https://t.me/madadio_uz');
                      },
                      title: context.translate('telegram'),
                    ),
                  ],
                ),
              ),
              AppUtils.kSpacer,
              Text(
                'v ${packageInfo.version} (${packageInfo.buildNumber})',
                style: context.textStyle.regularBody.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              AppUtils.kBoxHeight16,
            ],
          ),
        ),
      );
}
