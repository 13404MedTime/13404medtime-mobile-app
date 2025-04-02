import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius8,
        child: Ink(
          height: 60,
          width: double.infinity,
          padding: AppUtils.kPaddingAll12,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.theme.colorScheme.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppUtils.kSpacer,
              Ink(
                padding: AppUtils.kPaddingAll10,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 20),
              ),
            ],
          ),
        ),
      );
}
