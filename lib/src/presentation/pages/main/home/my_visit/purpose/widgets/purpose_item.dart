import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../components/buttons/card_button.dart';
import '../../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';

class PurposeItemWidget extends StatelessWidget {
  const PurposeItemWidget({
    required this.onTap,
    this.title = '',
    this.subtitle = '',
    this.items = const [],
    this.imageUrl = '',
    this.name = '',
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final List<String> items;
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        margin: AppUtils.kPadding0,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppUtils.kBorderRadius8,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppUtils.kBoxHeight8,
                SizedBox(
                  height: 32,
                  child: Row(
                    children: [
                      CustomCachedNetworkImage(
                        imageUrl: imageUrl,
                        borderRadius: AppUtils.kBorderRadius50,
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                      AppUtils.kBoxWidth8,
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
