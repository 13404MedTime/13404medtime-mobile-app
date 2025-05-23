import 'package:flutter/material.dart';

import '../../../../../app_options.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/source/local_source.dart';
import '../../../../../injector_container.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import 'widgets/language_bottom_widget.dart';
import 'widgets/theme_bottom_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(context.translate('settings'))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: AppUtils.kBorderRadius16,
          child: Material(
            color: Theme.of(context).cardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: AppUtils.kBorderRadius16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    onTap: () {
                      // ignore: inference_failure_on_function_invocation
                      customModalBottomSheet(
                        context: context,
                        builder: (_, controller) => LanguageBottomWidget(
                          onChanged: (lang) async {
                            AppOptions.update(
                              context,
                              options.copyWith(locale: Locale(lang)),
                            );
                            Navigator.pop(context);
                            await sl<LocalSource>().setLocale(lang);
                          },
                        ),
                      );
                    },
                    title: Text(
                      context.translate('language'),
                    )),
                AppUtils.kDivider,
                ListTile(
                  onTap: () {
                    // ignore: inference_failure_on_function_invocation
                    customModalBottomSheet(
                      context: context,
                      builder: (_, __) => ThemeBottomWidget(
                        onChanged: (mode) async {
                          AppOptions.update(
                            context,
                            options.copyWith(themeMode: mode),
                          );
                          Navigator.pop(context);
                          await sl<LocalSource>().setThemeMode(mode);
                        },
                      ),
                    );
                  },
                  title: Text(context.translate('theme')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
