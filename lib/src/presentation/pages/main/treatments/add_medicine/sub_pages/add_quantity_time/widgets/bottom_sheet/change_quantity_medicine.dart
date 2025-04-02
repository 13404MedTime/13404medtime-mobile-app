import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../bloc/add_medicine/add_medicine_bloc.dart';

class ChangeQuantityMedicineBottomSheet extends StatefulWidget {
  const ChangeQuantityMedicineBottomSheet({
    super.key,
    required this.initialItem,
  });

  final int initialItem;

  @override
  State<ChangeQuantityMedicineBottomSheet> createState() => _ChangeQuantityMedicineBottomSheetState();
}

class _ChangeQuantityMedicineBottomSheetState extends State<ChangeQuantityMedicineBottomSheet> {
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
                    context.translate('quantity'),
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
                    initialItem: widget.initialItem - 1,
                  ),
                  children: [
                    for (int i = 0; i < 150; i++)
                      SizedBox(
                        height: 37,
                        child: Center(
                          child: Text('${i + 1}'),
                        ),
                      )
                  ],
                  onSelectedItemChanged: (i) {
                    context.read<AddMedicineBloc>().add(
                          SetMedicineQuantityEvent(
                            medicineQuantity: (i + 1).toString(),
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
