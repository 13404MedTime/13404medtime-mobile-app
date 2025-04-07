import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/services/notification_service.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../main/profile/widgets/change_language_bottom_sheet.dart';
import '../../../main/profile/widgets/custom_dialog.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
          title: Text(
            context.translate('profile'),
            style: context.theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        body: Padding(
          padding: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  localSource.firstName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppUtils.kBoxHeight16,
              Center(
                child: Padding(
                  padding: AppUtils.kPaddingHorizontal16,
                  child: Text(
                    localSource.address,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: context.color.onBackground50,
                    ),
                  ),
                ),
              ),
              AppUtils.kBoxHeight16,
              AppUtils.kSpacer,
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    context.colorScheme.primary,
                  ),
                  foregroundColor: MaterialStatePropertyAll(
                    context.theme.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  customModalBottomSheet<void>(
                    context: context,
                    builder: (_, controller) => const ChangeLanguageBottomSheet(),
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.language),
                    AppUtils.kGap12,
                    Text(context.translate('language')),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationButton(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(context.colorScheme.error),
              foregroundColor: MaterialStatePropertyAll(context.theme.colorScheme.error),
              overlayColor: MaterialStatePropertyAll(context.colorScheme.error),
              surfaceTintColor: MaterialStatePropertyAll(context.colorScheme.error),
            ),
            onPressed: () {
              showDialog<bool>(
                context: context,
                builder: (_) => CustomDialog(
                  changeColor: true,
                  cancelActionText: context.translate('no'),
                  defaultActionText: context.translate('yes'),
                  desc: context.translate('logout_desc'),
                  title: context.translate('out'),
                ),
              ).then(
                (value) async {
                  if (value != null) {
                    if (value) {
                      localSource.setHasProfile(false);
                      final locale = localSource.locale;
                      await localSource.clear();
                      await localSource.setLocale(locale);
                      cancelAllNotifications();
                      if (context.mounted) {
                        unawaited(Navigator.pushNamedAndRemoveUntil(context, Routes.auth, (route) => false));
                      }
                    }
                  }
                },
              );
            },
            child: Text(
              context.translate('logout_account'),
              style: TextStyle(
                color: context.colorScheme.onError,
              ),
            ),
          ),
        ),
      );
}
