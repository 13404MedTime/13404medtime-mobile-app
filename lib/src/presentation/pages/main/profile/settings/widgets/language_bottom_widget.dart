import 'package:flutter/material.dart';

import '../../../../../../app_options.dart';
import '../../../../../../core/extension/extension.dart';

class LanguageBottomWidget extends StatelessWidget {
  const LanguageBottomWidget({
    super.key,
    required this.onChanged,
  });

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Text(context.translate('language')),
          ),
          ListTile(
            onTap: () {
              onChanged('ru');
            },
            title: const Text('RU'),
            trailing: Visibility(
              visible: AppOptions.of(context).locale.languageCode == 'ru',
              child: const Icon(Icons.check),
            ),
          ),
          ListTile(
            onTap: () {
              onChanged('uz');
            },
            title: const Text('UZ'),
            trailing: Visibility(
              visible: AppOptions.of(context).locale.languageCode == 'uz',
              child: const Icon(Icons.check),
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              onTap: () {
                onChanged('en');
              },
              title: const Text('EN'),
              trailing: Visibility(
                visible: AppOptions.of(context).locale.languageCode == 'en',
                child: const Icon(Icons.check),
              ),
            ),
          ),
        ],
      );
}
