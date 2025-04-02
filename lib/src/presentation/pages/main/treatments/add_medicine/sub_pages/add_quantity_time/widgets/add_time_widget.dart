import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';

class AddTimeWidget extends StatelessWidget {
  const AddTimeWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius8,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 6, 8, 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: context.theme.colorScheme.primary,
              ),
              AppUtils.kBoxWidth8,
              Text(
                context.translate('add'),
                style: context.textStyle.regularCallout.copyWith(
                  color: context.theme.colorScheme.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
}
