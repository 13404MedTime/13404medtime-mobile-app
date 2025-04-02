part of 'treatments_bloc.dart';

@freezed
class TreatmentsEvent with _$TreatmentsEvent {
  const factory TreatmentsEvent.getMedicineTakingMenu() = GetMedicineTakingMenuEvent;

  const factory TreatmentsEvent.getMedicineTaking() = GetMedicineTakingEvent;

  const factory TreatmentsEvent.addMedicineTaking() = AddMedicineTakingEvent;

  const factory TreatmentsEvent.deleteMedicine(int index) = DeleteMedicineEvent;

  const factory TreatmentsEvent.updateMedicineTaking() = UpdateMedicineTakingEvent;
}
