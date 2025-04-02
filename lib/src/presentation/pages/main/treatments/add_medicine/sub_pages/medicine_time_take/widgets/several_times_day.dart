import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../bloc/add_medicine/add_medicine_bloc.dart';

class SeveralTimesDayWidget extends StatefulWidget {
  const SeveralTimesDayWidget({super.key});

  @override
  State<SeveralTimesDayWidget> createState() => _SeveralTimesDayWidgetState();
}

class _SeveralTimesDayWidgetState extends State<SeveralTimesDayWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AddMedicineBloc, AddMedicineState>(
        builder: (context, state) => GestureDetector(
          onTap: state.medicineWeekdayStatus?.isSeveralDay ?? false
              ? () {}
              : () {
                  context.read<AddMedicineBloc>().add(
                        const ChangeMedicationDayTypeEvent(
                          medicineWeekdayStatus: MedicineWeekdayStatus.severalDay,
                        ),
                      );
                },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              border: Border.all(
                color: state.medicineWeekdayStatus?.isSeveralDay ?? false
                    ? context.theme.colorScheme.primary
                    : context.color.disabledCard,
              ),
            ),
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: Text(
                context.translate('several_times_day'),
                style: context.textStyle.regularCallout.copyWith(
                  color: state.medicineWeekdayStatus?.isSeveralDay ?? false
                      ? context.theme.colorScheme.primary
                      : context.color.black,
                ),
              ),
            ),
          ),
        ),
      );

  ///
// @override
// Widget build(BuildContext context) =>
//     BlocBuilder<AddMedicineBloc, AddMedicineState>(
//       builder: (context, state) => GestureDetector(
//         onTap: state.isVisibleSeveralTimesDay ? (){} : () {
//           if (state.isVisibleConstantly) {
//             context.read<AddMedicineBloc>().add(
//                   const IsVisibleConstantlyEvent(),
//                 );
//           }
//           if (state.isVisibleSpecificDaysWeek) {
//             context.read<AddMedicineBloc>().add(
//               const IsVisibleSpecificDayWeekEvent(),
//             );
//           }
//           context.read<AddMedicineBloc>().add(
//                 const IsVisibleSeveralTimeTakeEvent(),
//               );
//         },
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             borderRadius: AppUtils.kBorderRadius8,
//             border: Border.all(
//               color: state.isVisibleSeveralTimesDay
//                   ? context.theme.colorScheme.primary
//                   : context.color.disabledCard,
//             ),
//           ),
//           child: Padding(
//             padding: AppUtils.kPaddingAll16,
//             child: Text(
//               context.translate('several_times_day'),
//               style: context.textStyle.regularCallout.copyWith(
//                 color: state.isVisibleSeveralTimesDay
//                     ? context.theme.colorScheme.primary
//                     : context.color.black,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
}
