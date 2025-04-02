part of 'extension.dart';

extension SubPurposeMedicationTimesExtension on SubPurposeMedicationTimes {
  bool get todayAndTomorrowTimesIsNotEmpty => today.isNotEmpty || tomorrow.isNotEmpty;

  bool get tomorrowTimesIsNotEmpty => tomorrow.isNotEmpty;

  bool get todayTimesIsNotEmpty => today.isNotEmpty;
}
