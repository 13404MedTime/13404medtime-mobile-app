import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../bloc/add_medicine/add_medicine_bloc.dart';
import '../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import 'sub_pages/add_quantity_time/add_quantity_time.dart';
import 'sub_pages/medicine_name/medicine_name.dart';
import 'sub_pages/medicine_time_take/medicine_time_take_page.dart';
import 'widget/progress_widget.dart';

part 'package:madadio_client_mobile/src/presentation/pages/main/treatments/add_medicine/mixin/add_midiccine_mixin.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> with AddMedicineMixin {
  @override
  Widget build(BuildContext context) => BlocConsumer<AddMedicineBloc, AddMedicineState>(
        listener: (context, state) {
          if (state.isReceived) {
            Navigator.pop(context, true);
          }
        },
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading || previous.currentStep != current.currentStep,
        builder: (context, state) => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                toolbarHeight: (kToolbarHeight * 2) - 16,
                leading: BackButton(
                  onPressed: () async {
                    if (state.currentStep > 0) {
                      await pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: BlocSelector<AddMedicineBloc, AddMedicineState, int>(
                      selector: (state) => state.currentStep,
                      builder: (context, currentStep) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getPageTitles(currentStep),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AppUtils.kBoxHeight16,
                          ProgressWidget(currentStep: currentStep),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: PageView.builder(
                onPageChanged: (index) => _bloc.add(ChangeCurrentPageEvent(index: index)),
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MedicineNamePage(
                      pageController: pageController,
                    );
                  } else if (index == 1) {
                    return MedicineTimeTakePage(
                      pageController: pageController,
                    );
                  } else {
                    return const AddQuantityAndTimePage();
                  }
                },
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            if (state.isLoading) const CustomCircularProgressIndicator(),
          ],
        ),
      );
}
