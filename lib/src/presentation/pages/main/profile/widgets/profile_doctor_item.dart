import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../components/buttons/card_button.dart';

class ProfileDoctorItem extends StatelessWidget {
  const ProfileDoctorItem({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onTap,
  });

  final String title;
  final String buttonTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: AppUtils.kBorderRadius8,
        onTap: onTap ?? () {},
        child: Ink(
          padding: AppUtils.kPaddingAll16,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.theme.colorScheme.surface,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.theme.textTheme.bodyLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AppUtils.kBoxHeight32,
              CardButton(
                title: buttonTitle,
              ),
            ],
          ),
        ),
      );
}
