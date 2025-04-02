import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../data/models/add_medicine/metrics/metrics_response.dart';
import '../../../../../../../bloc/add_medicine/add_medicine_bloc.dart';
import '../../../../../../../components/bottom_sheet/bottom_sheet_app_bar.dart';
import '../../../../../../../components/buttons/bottom_navigation_button.dart';

// ignore: must_be_immutable
class MetricsBottomSheet extends StatelessWidget {
  MetricsBottomSheet({
    super.key,
    required this.bloc,
    required this.initialIndex,
  }) {
    lastIndex = initialIndex ?? 0;
  }

  final AddMedicineBloc bloc;
  final int? initialIndex;
  late int lastIndex;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BottomSheetAppBar(
              title: context.translate('units'),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 380,
            child: ClipRRect(
              borderRadius: AppUtils.kBorderRadius8,
              child: BlocSelector<AddMedicineBloc, AddMedicineState, List<MetricModel>>(
                bloc: bloc,
                selector: (state) => state.metrics,
                builder: (context, metrics) => CupertinoPicker(
                  itemExtent: 37,
                  squeeze: 0.9,
                  diameterRatio: 2.2,
                  scrollController: FixedExtentScrollController(
                    initialItem: initialIndex ?? 0,
                  ),
                  onSelectedItemChanged: (index) {
                    lastIndex = index;
                  },
                  children: List.generate(
                    metrics.length,
                    (index) => Center(
                      child: Text(metrics[index].getName(1)),
                    ),
                  ),
                  // children: [
                  //   for (int i = 0; i < metrics.length; i++)
                  //     SizedBox(
                  //       height: 37,
                  //       child: Center(
                  //         child: Text(metrics[i].getName(1)),
                  //       ),
                  //     )
                  // ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationButton(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              bloc.add(MetricIndexEvent(lastIndex));
              FocusScope.of(context).unfocus();
            },
            child: Text(
              context.translate('save'),
            ),
          ),
        ),
      );
}
