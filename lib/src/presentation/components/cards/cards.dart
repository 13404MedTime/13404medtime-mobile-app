import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, required this.child, this.color});

  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 1,
        color: color ?? context.theme.cardColor,
        surfaceTintColor: color ?? context.theme.cardColor,
        shadowColor: context.theme.shadowColor,
        type: MaterialType.card,
        borderRadius: AppUtils.kBorderRadius8,
        child: child,
      );
}
