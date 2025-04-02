// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class EmptyItem extends StatelessWidget {
  const EmptyItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.desc,
    this.backGroundColor,
    this.padding,
  });

  final String title;
  final String iconPath;
  final String desc;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? AppUtils.kPaddingHorizontal16,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backGroundColor ?? context.theme.colorScheme.background,
            borderRadius: AppUtils.kBorderRadius8,
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title.isNotEmpty)
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              AppUtils.kBoxHeight16,
              Image(
                image: AssetImage(iconPath),
                width: 200,
              ),
              AppUtils.kBoxHeight16,
              Text(
                desc,
                style: TextStyle(fontSize: 14, height: 1, color: context.color.onBackground50),
              ),
              AppUtils.kBoxHeight34,
            ],
          ),
        ),
      );
}
