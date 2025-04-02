import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../bloc/add_medicine/add_medicine_bloc.dart';

class ConstantlyWidget extends StatefulWidget {
  const ConstantlyWidget({super.key});

  @override
  State<ConstantlyWidget> createState() => _ConstantlyWidgetState();
}

class _ConstantlyWidgetState extends State<ConstantlyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AddMedicineBloc, AddMedicineState>(
        builder: (context, state) => GestureDetector(
          onTap: state.medicineWeekdayStatus?.isAllDays ?? false
              ? () {}
              : () {
                  context.read<AddMedicineBloc>().add(
                        const ChangeMedicationDayTypeEvent(medicineWeekdayStatus: MedicineWeekdayStatus.allDays),
                      );
                },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              border: Border.all(
                color: state.medicineWeekdayStatus?.isAllDays ?? false
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
                    context.translate('constantly'),
                    style: context.textStyle.regularCallout.copyWith(
                      color: state.medicineWeekdayStatus?.isAllDays ?? false
                          ? context.theme.colorScheme.primary
                          : context.color.black,
                    ),
                  ),
                  AppUtils.kBoxHeight4,
                  Text(
                    context.translate('daily'),
                    style: context.textStyle.regularCaption1,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

// @override
// Widget build(BuildContext context) =>
//     BlocBuilder<AddMedicineBloc, AddMedicineState>(
//       builder: (context, state) => GestureDetector(
//         onTap: state.isVisibleConstantly ? (){} : () {
//           if (state.isVisibleSeveralTimesDay) {
//             context.read<AddMedicineBloc>().add(
//                   const IsVisibleSeveralTimeTakeEvent(),
//                 );
//           }
//           if (state.isVisibleSpecificDaysWeek) {
//             context.read<AddMedicineBloc>().add(
//                   const IsVisibleSpecificDayWeekEvent(),
//                 );
//           }
//           context.read<AddMedicineBloc>().add(
//                 const IsVisibleConstantlyEvent(),
//               );
//         },
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             borderRadius: AppUtils.kBorderRadius8,
//             border: Border.all(
//               color: state.isVisibleConstantly
//                   ? context.theme.colorScheme.primary
//                   : context.color.disabledCard,
//             ),
//           ),
//           child: Padding(
//             padding: AppUtils.kPaddingAll16,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Постоянно',
//                   style: context.textStyle.regularCallout.copyWith(
//                     color: state.isVisibleConstantly
//                         ? context.theme.colorScheme.primary
//                         : context.color.black,
//                   ),
//                 ),
//                 AppUtils.kBoxHeight4,
//                 Text(
//                   context.translate('daily'),
//                   style: context.textStyle.regularCaption1,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
}
