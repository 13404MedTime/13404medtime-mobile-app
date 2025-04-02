import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../bloc/add_medicine/add_medicine_bloc.dart';

class SpecificDaysWeekWidget extends StatefulWidget {
  const SpecificDaysWeekWidget({super.key});

  @override
  State<SpecificDaysWeekWidget> createState() => _SpecificDaysWeekWidgetState();
}

class _SpecificDaysWeekWidgetState extends State<SpecificDaysWeekWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AddMedicineBloc, AddMedicineState>(
        listenWhen: (previous, current) => previous.medicineWeekdayStatus != current.medicineWeekdayStatus,
        listener: (context, state) {
          if (state.medicineWeekdayStatus?.isSelectedDays ?? false) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        builder: (context, state) => GestureDetector(
          onTap: state.medicineWeekdayStatus?.isSelectedDays ?? false
              ? () {}
              : () {
                  context.read<AddMedicineBloc>().add(
                        const ChangeMedicationDayTypeEvent(
                          medicineWeekdayStatus: MedicineWeekdayStatus.selectedDays,
                        ),
                      );
                },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              border: Border.all(
                color: state.medicineWeekdayStatus?.isSelectedDays ?? false
                    ? context.theme.colorScheme.primary
                    : context.color.disabledCard,
              ),
            ),
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.translate('specific_days_of_the_week'),
                    style: context.textStyle.regularCallout.copyWith(
                      color: state.medicineWeekdayStatus?.isSelectedDays ?? false
                          ? context.theme.colorScheme.primary
                          : context.color.black,
                    ),
                  ),
                  AppUtils.kBoxHeight4,
                  SizeTransition(
                    sizeFactor: _animationController,
                    axisAlignment: -1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate('for_example_weekdays'),
                          style: context.textStyle.regularCaption1,
                        ),
                        AppUtils.kBoxHeight16,
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: List.generate(
                            weekdays.length,
                            (index) => GestureDetector(
                              onTap: () {
                                context.read<AddMedicineBloc>().add(
                                      ChangeMedicationDaysEvent(
                                        dayIndex: weekdays[index].index,
                                      ),
                                    );
                              },
                              child: Material(
                                color: state.medicationWeekdays.contains(weekdays[index].index)
                                    ? context.theme.colorScheme.primary
                                    : context.color.disabledCard,
                                borderRadius: AppUtils.kBorderRadius8,
                                child: Padding(
                                  padding: AppUtils.kPaddingAll8,
                                  child: Text(
                                    context.translate(weekdays[index].name),
                                    style: context.textStyle.regularCallout.copyWith(
                                      color: state.medicationWeekdays.contains(weekdays[index].index)
                                          ? context.theme.colorScheme.onSecondary
                                          : context.color.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 38,
                        //   child: ListView.separated(
                        //     physics: const BouncingScrollPhysics(),
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: weekdays.length,
                        //     itemBuilder: (context, index) => GestureDetector(
                        //       onTap: () {
                        //         context.read<AddMedicineBloc>().add(
                        //               ChangeMedicationDaysEvent(
                        //                 dayIndex: weekdays[index].index,
                        //               ),
                        //             );
                        //       },
                        //       child: Material(
                        //         color: state.medicationWeekdays
                        //                 .contains(weekdays[index].index)
                        //             ? context.theme.colorScheme.primary
                        //             : context.color.disabledCard,
                        //         borderRadius: AppUtils.kBorderRadius8,
                        //         child: Padding(
                        //           padding: AppUtils.kPaddingAll8,
                        //           child: Text(
                        //             weekdays[index].name,
                        //             style: context.textStyle.regularCallout
                        //                 .copyWith(
                        //               color: state.medicationWeekdays
                        //                       .contains(weekdays[index].index)
                        //                   ? context
                        //                       .theme.colorScheme.onSecondary
                        //                   : context.color.black,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     separatorBuilder: (context, index) =>
                        //         AppUtils.kBoxWidth8,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
