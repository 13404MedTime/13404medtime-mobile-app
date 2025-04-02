import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class SecondPageItemsWidget extends StatelessWidget {
  const SecondPageItemsWidget({
    super.key,
    required this.itemName,
    required this.onTap,
    this.errorText = '',
    this.showError = false,
    this.isSelected = false,
  });

  final VoidCallback onTap;
  final String itemName;
  final String errorText;
  final bool showError;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: context.color.disabledCard,
            borderRadius: AppUtils.kBorderRadius8,
            child: ListTile(
              onTap: onTap,
              shape: showError
                  ? const RoundedRectangleBorder(
                      borderRadius: AppUtils.kBorderRadius8,
                      side: BorderSide(
                        color: Colors.red,
                      ),
                    )
                  : null,
              tileColor: Colors.transparent,
              title: Text(
                itemName,
                style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  color: isSelected ? null : context.color.onBackground50,
                ),
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),
          if (showError) ...[
            AppUtils.kBoxHeight4,
            Text(
              '     $errorText',
              style: TextStyle(
                fontSize: 13,
                color: context.theme.colorScheme.error,
              ),
            ),
          ],
        ],
      );
}
