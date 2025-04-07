part of '../add_free_time.dart';

mixin AddFreeTimeMixin on State<AddFreeTime> {
  late final TextEditingController dateTimeController;
  late final TextEditingController startTimeController;
  late final TextEditingController endTimeController;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateTimeController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    if (widget.id != null) {
      dateTimeController.text = DateFormat('dd-MM-yyyy').format(
        widget.id!.date.subtract(
          const Duration(days: 1),
        ),
      );
      dateTime = widget.id!.date;
      startTimeController.text = widget.id!.fromTime;
      endTimeController.text = widget.id!.toTime;
    }
  }

  @override
  void dispose() {
    dateTimeController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }
}
