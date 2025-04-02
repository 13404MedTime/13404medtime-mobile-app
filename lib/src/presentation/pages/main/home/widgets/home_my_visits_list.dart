import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/home/get_visits/get_visits_response.dart';
import 'home_my_visits_item.dart';

class HomeMyVisitsListWidget extends StatelessWidget {
  const HomeMyVisitsListWidget({
    required this.onTap,
    this.myVisits = const [],
    super.key,
  });

  final void Function(int index) onTap;
  final List<MyVisitModel> myVisits;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: SizedBox(
          height: 194 + 32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: AppUtils.kPaddingAll8,
            itemCount: myVisits.length,
            itemBuilder: (_, index) => HomeMyVisitsItemWidget(
              data: myVisits[index],
              onTap: () => onTap(index),
            ),
          ),
        ),
      );
}
