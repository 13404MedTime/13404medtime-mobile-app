import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/my_appointments/my_appointments_response.dart';
import 'home_history_item.dart';

class HomeHistoryListWidget extends StatelessWidget {
  const HomeHistoryListWidget({
    required this.onTap,
    this.medicalData = const [],
    this.names = const {},
    super.key,
  });

  final void Function(int index) onTap;
  final List<NaznachenieIdData> medicalData;
  final Map<String, List<String>> names;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: SizedBox(
          height: 169 + 32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: AppUtils.kPaddingAll8,
            itemCount: medicalData.length,
            itemBuilder: (_, index) => HomeHistoryItemWidget(
              onTap: () => onTap(index),
              data: medicalData[index],
              names: names[medicalData[index].guid] ?? [],
            ),
          ),
        ),
      );
}
