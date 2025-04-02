import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../components/bottom_sheet/bottom_sheet_app_bar.dart';

class EnterBirthBottomSheet extends StatelessWidget {
  const EnterBirthBottomSheet({
    super.key,
    this.title = '',
    this.initialDate,
  });

  final String title;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    DateTime? date;
    return SafeArea(
      minimum: AppUtils.kPaddingAll16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppUtils.kGap8,
          BottomSheetAppBar(title: title),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              initialDateTime: initialDate,
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
              maximumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                date = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, date);
            },
            child: Text(context.translate('save')),
          ),
        ],
      ),
    );
  }
}
