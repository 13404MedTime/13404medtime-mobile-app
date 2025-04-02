part of 'sub_purpose_bloc.dart';

@freezed
class SubPurposeState with _$SubPurposeState {
  const factory SubPurposeState({
    @Default([]) List<MedicineTakingModel> allPreparatsOfNaznachenie,
    @Default({}) Map<String, SubPurposeMedicationTimes> medicationTimes,
    @Default(SubPurposeStatus.inital) SubPurposeStatus status,
    @Default({}) Map<String, List<FileModel>> files,
    @Default(false) bool isLoadingFiles,
  }) = _SubPurposeState;
}
