import '../my_appointments/my_appointments_response.dart';

class SubPurposeMedicationTimes {
  SubPurposeMedicationTimes({
    required this.today,
    required this.tomorrow,
  });

  List<SubPurposeMedicationTimesItem> today;
  List<SubPurposeMedicationTimesItem> tomorrow;
}

class SubPurposeMedicationTimesItem {
  SubPurposeMedicationTimesItem({
    required this.data,
    required this.time,
  });

  final MyAppointModel data;
  final String time;
}
