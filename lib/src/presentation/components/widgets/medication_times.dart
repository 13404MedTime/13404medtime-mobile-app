import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';
import '../buttons/card_button.dart';

class MedicationTimesWidget extends StatelessWidget {
  const MedicationTimesWidget({
    this.title = '',
    this.items = const [],
    super.key,
  });

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          border: Border.all(
            color: context.theme.colorScheme.background,
          ),
        ),
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              if (items.isNotEmpty) ...[
                AppUtils.kBoxHeight12,
                Wrap(
                  spacing: 6,
                  runSpacing: 8,
                  children: [
                    for (int i = 0; i < items.length; i++)
                      CardButton(
                        padding: AppUtils.kPaddingHor8Ver4,
                        title: items[i],
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      );
}
