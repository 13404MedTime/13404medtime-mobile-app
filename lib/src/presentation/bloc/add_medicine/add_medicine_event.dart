part of 'add_medicine_bloc.dart';

abstract class AddMedicineEvent extends Equatable {
  const AddMedicineEvent();
}

/// ----------- Add Medicine Page Events -----------

class ChangeCurrentPageEvent extends AddMedicineEvent {
  const ChangeCurrentPageEvent({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

/// ----------- Add Medicine Name And Type Page Events -----------

class MedicineNameTextFieldEvent extends AddMedicineEvent {
  const MedicineNameTextFieldEvent({
    required this.medicineName,
    this.selectedDrug,
  });

  final String medicineName;
  final DrugModel? selectedDrug;

  @override
  List<Object?> get props => [medicineName, selectedDrug];
}

/// ----------- Add Medicine Time Take Page Events -----------

class ChangeMedicationDayTypeEvent extends AddMedicineEvent {
  const ChangeMedicationDayTypeEvent({required this.medicineWeekdayStatus});

  final MedicineWeekdayStatus medicineWeekdayStatus;

  @override
  List<Object?> get props => [medicineWeekdayStatus];
}

class ChangeMedicationDaysEvent extends AddMedicineEvent {
  const ChangeMedicationDaysEvent({required this.dayIndex});

  final int dayIndex;

  @override
  List<Object?> get props => [dayIndex];
}

// class IsVisibleSeveralTimeTakeEvent extends AddMedicineEvent {
//   const IsVisibleSeveralTimeTakeEvent();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class IsVisibleConstantlyEvent extends AddMedicineEvent {
//   const IsVisibleConstantlyEvent();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class SetYourWeakDaysEvent extends AddMedicineEvent {
//   const SetYourWeakDaysEvent({required this.weakDays});
//
//   final String weakDays;
//
//   @override
//   List<Object?> get props => [weakDays];
// }
//
// class IsVisibleSpecificDayWeekEvent extends AddMedicineEvent {
//   const IsVisibleSpecificDayWeekEvent();
//
//   @override
//   List<Object?> get props => [];
// }

/// ----------- Add Medicine Quantity And Tme Page -----------

class SetTimeTakeMedicineEvent extends AddMedicineEvent {
  const SetTimeTakeMedicineEvent({required this.timeTakeMedicine});

  final String timeTakeMedicine;

  @override
  List<Object?> get props => [timeTakeMedicine];
}

class SetMedicineQuantityEvent extends AddMedicineEvent {
  const SetMedicineQuantityEvent({required this.medicineQuantity});

  final String medicineQuantity;

  @override
  List<Object?> get props => [medicineQuantity];
}

class SetMedicineDosageEvent extends AddMedicineEvent {
  const SetMedicineDosageEvent({required this.medicineDosage});

  final String medicineDosage;

  @override
  List<Object?> get props => [medicineDosage];
}

class SetMedicineTakeHourMinuteEvent extends AddMedicineEvent {
  const SetMedicineTakeHourMinuteEvent({required this.medicineTakeHourMinute});

  final String medicineTakeHourMinute;

  @override
  List<Object?> get props => [medicineTakeHourMinute];
}

class DeleteMedicineTakeHourMinuteEvent extends AddMedicineEvent {
  const DeleteMedicineTakeHourMinuteEvent({required this.medicineTakeHourMinute});

  final String medicineTakeHourMinute;

  @override
  List<Object?> get props => [medicineTakeHourMinute];
}

class UpdateMedicineTakeHourMinuteEvent extends AddMedicineEvent {
  const UpdateMedicineTakeHourMinuteEvent({required this.medicineTakeHourMinute, required this.index});

  final String medicineTakeHourMinute;
  final int index;

  @override
  List<Object?> get props => [medicineTakeHourMinute, index];
}

class GetMetricsEvent extends AddMedicineEvent {
  const GetMetricsEvent();

  @override
  List<Object?> get props => [];
}

class MetricIndexEvent extends AddMedicineEvent {
  const MetricIndexEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class SaveMedicationEvent extends AddMedicineEvent {
  const SaveMedicationEvent();

  @override
  List<Object?> get props => [];
}

class DrugSelectedEvent extends AddMedicineEvent {
  const DrugSelectedEvent({required this.drug});

  final DrugModel drug;

  @override
  List<Object?> get props => [drug];
}
