import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    this.onTap,
    required this.title,
    this.padding,
    this.showWhen = false,
  });
  final String title;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final bool showWhen;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: AppUtils.kBorderRadius100,
        onTap: onTap,
        child: Container(
          padding: padding ?? AppUtils.kPaddingHor12Ver8,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius100,
            color: context.theme.colorScheme.background,
          ),
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.color.grey,
            ),
          ),
        ),
      );
}
