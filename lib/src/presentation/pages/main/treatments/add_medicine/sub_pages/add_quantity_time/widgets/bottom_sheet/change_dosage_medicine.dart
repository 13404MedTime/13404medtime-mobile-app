import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../bloc/add_medicine/add_medicine_bloc.dart';

class ChangeDosageMedicineBottomSheet extends StatefulWidget {
  const ChangeDosageMedicineBottomSheet({
    super.key,
    required this.initialItem,
  });

  final double initialItem;

  @override
  State<ChangeDosageMedicineBottomSheet> createState() => _ChangeDosageMedicineBottomSheetState();
}

class _ChangeDosageMedicineBottomSheetState extends State<ChangeDosageMedicineBottomSheet> {
  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Text(
                    context.translate('dosage'),
                    style: context.textStyle.appBarTitle,
                  ),
                  AppUtils.kSpacer,
                  InkWell(
                    borderRadius: AppUtils.kBorderRadius50,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: context.color.disabledCard,
                        shape: BoxShape.circle,
                      ),
                      padding: AppUtils.kPaddingAll6,
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppUtils.kBoxHeight32,
            Expanded(
              child: ClipRRect(
                borderRadius: AppUtils.kBorderRadius8,
                child: CupertinoPicker(
                  backgroundColor: context.theme.colorScheme.background,
                  itemExtent: 37,
                  squeeze: 1,
                  scrollController: FixedExtentScrollController(
                    initialItem: formatNumToInt(widget.initialItem),
                  ),
                  children: [
                    for (double i = 0.25; i <= 5.0; i += 0.25)
                      SizedBox(
                        height: 37,
                        child: Center(
                          child: Text('$i'),
                        ),
                      )
                  ],
                  onSelectedItemChanged: (i) {
                    context.read<AddMedicineBloc>().add(
                          SetMedicineDosageEvent(
                            medicineDosage: formatNum(i + 1),
                          ),
                        );
                  },
                ),
              ),
            ),
            AppUtils.kBoxHeight32,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(context.translate('save')),
            ),
          ],
        ),
      );
}

String formatNum(int number) {
  if (number >= 0 && number <= 20) {
    return (number * 0.25).toString();
  }
  return number.toString();
}

int formatNumToInt(double number) {
  if (number >= 0.25 && number <= 5.0) {
    return (number - 0.25) ~/ 0.25;
  }
  return 0;
}
