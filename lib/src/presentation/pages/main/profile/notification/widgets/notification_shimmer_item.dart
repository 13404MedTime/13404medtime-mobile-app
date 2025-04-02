import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../components/widgets/custom_shimmer_widget.dart';

class NotificationShimmerItem extends StatelessWidget {
  const NotificationShimmerItem({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: AppUtils.kPaddingHor12Ver8,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.theme.colorScheme.surface,
        ),
        width: double.infinity,
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomShimmerWidget(
                child: SizedBox(
                  height: 20,
                  child: Text('                                                                '),
                ),
              ),
              AppUtils.kBoxHeight8,
              CustomShimmerWidget(
                child: SizedBox(
                  height: 16,
                  child: Text('                                                                         '),
                ),
              ),
              AppUtils.kBoxHeight4,
              CustomShimmerWidget(
                child: SizedBox(height: 16, child: Text('                                            ')),
              ),
              AppUtils.kBoxHeight8,
              CustomShimmerWidget(
                child: SizedBox(height: 13, child: Text('                        ')),
              ),
            ]),
      );
}
