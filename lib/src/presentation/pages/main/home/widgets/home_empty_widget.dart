// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../components/paint/empty_painter.dart';

class HomeEmptyWidget extends StatelessWidget {
  const HomeEmptyWidget({
    super.key,
    required this.onTap,
    this.padding,
  });

  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(16, 32, 16, 24),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: AppUtils.kBorderRadius8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomPaint(
                size: Size(
                  (MediaQuery.sizeOf(context).width / 375) * 311,
                  (MediaQuery.sizeOf(context).width / 375) * 354,
                ),
                painter: EmptyPainter(),
              ),
              AppUtils.kBoxHeight42,
              Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: ElevatedButton(onPressed: onTap, child: Text(context.translate('contact_doctor'))),
              ),
            ],
          ),
        ),
      );
}
