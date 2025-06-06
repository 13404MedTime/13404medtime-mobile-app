import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class AppointmentItemWidget extends StatelessWidget {
  const AppointmentItemWidget({
    this.imageUrl = '',
    this.name = '',
    this.shortDescription = '',
    this.time = '',
    this.isToday = false,
    required this.onChanged,
    required this.isTake,
    this.isLoading = false,
    this.isChanged = false,
    super.key,
  });

  final String imageUrl;
  final String name;
  final String shortDescription;
  final String time;
  final bool isToday;
  final bool isTake;
  final ValueChanged<bool> onChanged;
  final bool isLoading;
  final bool isChanged;

  @override
  Widget build(BuildContext context) => Card(
        margin: AppUtils.kPadding0,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
          child: SizedBox(
            child: Row(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.fitWidth,
                ),
                AppUtils.kBoxWidth12,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                      AppUtils.kBoxHeight6,
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                AppUtils.kBoxWidth8,
                if (isToday)
                  IconButton(
                    onPressed: isTake ? null : () => onChanged(!isTake),
                    icon: Icon(
                      isTake ? Icons.check_box : Icons.check_box_outline_blank_outlined,
                      color: isTake
                          ? context.theme.colorScheme.primary.withOpacity(isLoading && isChanged ? 1 : 0.5)
                          : context.theme.colorScheme.onSurface,
                      size: 30,
                    ),
                  )
              ],
            ),
          ),
        ),
      );
}
