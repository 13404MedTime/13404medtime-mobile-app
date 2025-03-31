import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/extension/extension.dart';
import '../bottom_sheet/custom_bottom_sheet.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({
    super.key,
    // required this.field,
    required this.onChanged,
  });

  // final FieldsOptionEntity field;
  final ValueChanged onChanged;

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  late TextEditingController dateController;
  late TextEditingController timeController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
    timeController = TextEditingController();
    // if (widget.field.value == null || widget.field.value == "") {
    //   dateController = TextEditingController();
    //   timeController = TextEditingController();
    // } else {
    //   dateController = TextEditingController(
    //     text: widget.field.value.toString().dateTime1(),
    //   );
    //   timeController = TextEditingController(
    //     text: widget.field.value.toString().time(),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // LabelText(field: widget.field),
          AppUtils.kBoxHeight4,
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onPrimary,
              borderRadius: AppUtils.kBorderRadius12,
              border: Border.fromBorderSide(
                BorderSide(
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    style: context.theme.textTheme.titleMedium,
                    onChanged: widget.onChanged,
                    controller: dateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime now = DateTime.now();
                      if (dateController.text.isNotEmpty) {
                        now = DateFormat('dd.MM.yyyy').parse(dateController.text);
                      }
                      final DateTime? date = await customModalBottomSheet(
                        context: context,
                        builder: (_, controller) => Stack(
                          children: [
                            SizedBox(
                              height: 300,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (date) {
                                  now = date;
                                  dateController.text = DateFormat('dd.MM.yyyy').format(
                                    date,
                                  );
                                  widget.onChanged(
                                    DateFormat("yyyy-MM-dd'T'${timeController.text}:ss'Z'").format(date),
                                  );
                                },
                                initialDateTime: now,
                                minimumYear: now.year - 50,
                                maximumYear: now.year + 50,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop(now);
                                },
                                icon: const Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Color(0xFF0082FF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      if (date != null) {
                        dateController.text = DateFormat('dd.MM.yyyy').format(
                          date,
                        );
                        widget.onChanged(
                          DateFormat("yyyy-MM-dd'T'${timeController.text}:ss'Z'").format(date),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 12,
                      ),
                      fillColor: context.theme.colorScheme.onPrimary,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: context.theme.colorScheme.onSurface,
                  thickness: 1,
                  width: 2,
                ),
                Flexible(
                  child: TextField(
                    style: context.theme.textTheme.titleMedium,
                    onChanged: widget.onChanged,
                    controller: timeController,
                    readOnly: true,
                    onTap: () async {
                      DateTime now = DateTime.now();
                      if (timeController.text.length == 5) {
                        now = DateFormat('HH:mm').parse(timeController.text);
                      }
                      final DateTime? picked = await customModalBottomSheet(
                        context: context,
                        builder: (_, __) => Stack(
                          children: [
                            SizedBox(
                              height: 300,
                              child: CupertinoDatePicker(
                                use24hFormat: true,
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (time) {
                                  now = time;
                                  timeController.text = DateFormat('HH:mm').format(
                                    time,
                                  );
                                  widget.onChanged(
                                    DateFormat(
                                      "${dateController.text.dateTime2()}'T'HH:mm:ss'Z'",
                                    ).format(time),
                                  );
                                },
                                initialDateTime: now,
                                minimumYear: now.year - 1,
                                maximumYear: now.year + 1,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop(now);
                                },
                                icon: const Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Color(0xFF0082FF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      if (picked != null) {
                        timeController.text = DateFormat('HH:mm').format(picked);
                        widget.onChanged(
                          DateFormat("${dateController.text.dateTime2()}'T'HH:mm:ss'Z'").format(picked),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                      suffixIcon: const Icon(Icons.access_time_outlined),
                      fillColor: context.theme.colorScheme.onPrimary,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
