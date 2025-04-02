import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../bloc/add_medicine/add_medicine_bloc.dart';
import '../../../../../../components/buttons/bottom_navigation_button.dart';
import 'widgets/constantly.dart';
import 'widgets/specific_days_week.dart';

class MedicineTimeTakePage extends StatefulWidget {
  const MedicineTimeTakePage({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<MedicineTimeTakePage> createState() => _MedicineTimeTakePageState();
}

class _MedicineTimeTakePageState extends State<MedicineTimeTakePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SeveralTimesDayWidget(),
                    // AppUtils.kBoxHeight8,
                    SpecificDaysWeekWidget(),
                    AppUtils.kBoxHeight8,
                    ConstantlyWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationButton(
          child: BlocBuilder<AddMedicineBloc, AddMedicineState>(
            builder: (context, state) => ElevatedButton(
              onPressed: state.medicineWeekdayStatus != null && state.medicationWeekdays.isNotEmpty
                  ? () {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
              child: Text(
                context.translate('continue'),
              ),
            ),
          ),
        ),
      );
}
