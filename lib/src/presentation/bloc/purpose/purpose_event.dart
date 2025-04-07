part of 'purpose_bloc.dart';

@freezed
class PurposeEvent with _$PurposeEvent {
  const factory PurposeEvent.getMedicalByDoctor({
    required String doctorId,
  }) = GetMedicalByDoctor;

  const factory PurposeEvent.addMedicalByDoctor({
    required String doctorId,
  }) = AddMedicalByDoctor;
}
