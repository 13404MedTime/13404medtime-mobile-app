import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../components/widgets/custom_shimmer_widget.dart';
import 'title_shimmer.dart';

class HorizontalHomeItemShimmer extends StatelessWidget {
  const HorizontalHomeItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: TitleShimmer(),
          ),
          Padding(
            padding: AppUtils.kPaddingAll16,
            child: SizedBox(
              height: 169 + 32,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CustomShimmerWidget(
                  width: 200,
                  borderRadius: 8,
                ),
                separatorBuilder: (context, index) => AppUtils.kBoxWidth16,
                itemCount: 5,
              ),
            ),
          ),
        ],
      );
}
