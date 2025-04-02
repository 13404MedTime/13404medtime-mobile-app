import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';

class ShowTimeWidget extends StatelessWidget {
  const ShowTimeWidget({
    super.key,
    required this.time,
    required this.onChangeTimeTap,
    required this.onDeleteTimeTap,
    required this.isDeleteVisible,
  });

  final String time;
  final VoidCallback onChangeTimeTap;
  final VoidCallback onDeleteTimeTap;
  final bool isDeleteVisible;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: AppUtils.kBorderRadius8,
              onTap: onChangeTimeTap,
              child: Ink(
                padding: AppUtils.kPaddingAll12,
                decoration: BoxDecoration(
                  color: context.color.disabledCard,
                  borderRadius: AppUtils.kBorderRadius8,
                ),
                child: Row(
                  children: [
                    Text(
                      context.translate('time'),
                      style: context.textStyle.regularCallout.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                        fontSize: 15,
                      ),
                    ),
                    AppUtils.kSpacer,
                    Text(
                      time,
                      style: context.textStyle.regularCallout.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                      ),
                    ),
                    AppUtils.kBoxWidth8,
                    Icon(
                      Icons.arrow_forward_ios,
                      color: context.theme.colorScheme.primary,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isDeleteVisible,
            child: AppUtils.kBoxWidth12,
          ),
          Visibility(
            visible: isDeleteVisible,
            child: GestureDetector(
              onTap: onDeleteTimeTap,
              child: CircleAvatar(
                backgroundColor: context.color.disabledCard,
                radius: 17,
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      );
}
