part of 'sub_purpose_bloc.dart';

@freezed
class SubPurposeEvent with _$SubPurposeEvent {
  // const factory SubPurposeEvent.getAllPreparatsOfNaznachenie({
  //   required String naznachenieId,
  // }) = GetAllPrepartsOfNaznachenie;
  //
  // const factory SubPurposeEvent.getMedicationTimes({
  //   required String naznachenieId,
  // }) = GetMedicationTimes;

  const factory SubPurposeEvent.getMedicationData({
    required String naznachenieId,
  }) = GetMedicationDataEvent;

  const factory SubPurposeEvent.getFiles({
    required String naznachenieId,
  }) = GetFilesEvent;
}
