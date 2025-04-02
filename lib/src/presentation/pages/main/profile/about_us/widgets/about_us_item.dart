// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class AboutUsItem extends StatelessWidget {
  const AboutUsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.coloredItem,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool coloredItem;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: coloredItem ? context.theme.colorScheme.primary : context.color.disabledCard),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: coloredItem ? context.theme.colorScheme.surface : context.theme.colorScheme.onBackground,
            ),
            AppUtils.kBoxWidth8,
            Text(
              title,
              style: TextStyle(
                  color: coloredItem ? context.theme.colorScheme.surface : context.theme.colorScheme.onBackground),
            ),
          ],
        ),
      );
}
