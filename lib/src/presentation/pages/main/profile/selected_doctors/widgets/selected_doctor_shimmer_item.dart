import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../components/widgets/custom_shimmer_widget.dart';

class SelectedDoctorShimmerItem extends StatelessWidget {
  const SelectedDoctorShimmerItem({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: AppUtils.kPaddingHor12Ver8,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.theme.colorScheme.surface,
        ),
        width: double.infinity,
        child: const Row(
          children: [
            CustomShimmerWidget(
              borderRadius: 100,
              height: 25,
              width: 25,
              child: CircleAvatar(
                maxRadius: 25,
              ),
            ),
            AppUtils.kBoxWidth12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomShimmerWidget(
                    child: SizedBox(
                      height: 20,
                      child: Text('                                                    '),
                    ),
                  ),
                  AppUtils.kBoxHeight12,
                  CustomShimmerWidget(
                    child: SizedBox(height: 16, child: Text('                                            ')),
                  ),
                  AppUtils.kBoxHeight8,
                ],
              ),
            ),
            AppUtils.kBoxWidth16,
            CustomShimmerWidget(
              borderRadius: 16,
              child: SizedBox(
                height: 30,
                width: 70,
              ),
            ),
          ],
        ),
      );
}
