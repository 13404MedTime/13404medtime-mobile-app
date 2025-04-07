import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../components/bottom_sheet/bottom_sheet_app_bar.dart';
import '../../args/sub_health_bottom_sheet_args.dart';

class ChooseDatePickerBottomSheetWidget extends StatefulWidget {
  const ChooseDatePickerBottomSheetWidget({
    super.key,
    this.args,
  });

  final SubHealthBottomSheetArgs? args;

  @override
  State<ChooseDatePickerBottomSheetWidget> createState() => _ChooseDatePickerBottomSheetWidgetState();
}

class _ChooseDatePickerBottomSheetWidgetState extends State<ChooseDatePickerBottomSheetWidget> {
  late DateTime date =
      widget.args?.checkedData?.ddmmyyyyToDateTime ?? DateTime.now().subtract(const Duration(seconds: 1));

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BottomSheetAppBar(title: context.translate('date')),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: date,
                minimumYear: 1990,
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
                widget.args?.checkedData = date.formatDate;
                widget.args?.date = date;
                Navigator.pop(context, widget.args);
              },
              child: Text(context.translate('save')),
            )
          ],
        ),
      );
}
