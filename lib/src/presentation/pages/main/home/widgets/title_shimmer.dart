import 'package:flutter/material.dart';

import '../../../../components/widgets/custom_shimmer_widget.dart';

class TitleShimmer extends StatelessWidget {
  const TitleShimmer({super.key});

  @override
  Widget build(BuildContext context) => const Row(
        children: [
          CustomShimmerWidget(
            height: 24,
            child: Text('                                 '),
          ),
          Spacer(),
          CustomShimmerWidget(
            height: 24,
            child: Text('                     '),
          ),
        ],
      );
}
