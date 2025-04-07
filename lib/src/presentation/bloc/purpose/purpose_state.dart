part of 'purpose_bloc.dart';

// class PurposeState extends Equatable {
//   const PurposeState({
//     this.isLoading = false,
//     this.medicalHistory = const [],
//     this.medicationTimes = const {},
//     this.medicalHistoryDrugNames = const {},
//     this.medicalHistoryDrugs = const {},
//   });
//
//   PurposeState copyWith({
//     final bool? isLoading,
//     final List<NaznachenieIdData>? medicalHistory,
//     final Map<String, List<SubPurposeMedicationTimesItem>>? medicationTimes,
//     final Map<String, List<String>>? medicalHistoryDrugNames,
//     final Map<String, MedicineTakingModel>? medicalHistoryDrugs,
//   }) =>
//       PurposeState(
//         isLoading: isLoading ?? this.isLoading,
//         medicalHistory: medicalHistory ?? this.medicalHistory,
//         medicationTimes: medicationTimes ?? this.medicationTimes,
//         medicalHistoryDrugNames:
//             medicalHistoryDrugNames ?? this.medicalHistoryDrugNames,
//         medicalHistoryDrugs: medicalHistoryDrugs ?? this.medicalHistoryDrugs,
//       );
//
//   final bool isLoading;
//   final List<NaznachenieIdData> medicalHistory;
//   final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes;
//   final Map<String, List<String>> medicalHistoryDrugNames;
//   final Map<String, MedicineTakingModel> medicalHistoryDrugs;
//
//   @override
//   List<Object?> get props => [
//         isLoading,
//         medicalHistory,
//         medicationTimes,
//         medicalHistoryDrugNames,
//         medicalHistoryDrugs,
//       ];
// }

@freezed
class PurposeState with _$PurposeState {
  const factory PurposeState({
    @Default(false) bool isLoading,
    @Default(false) bool isAdding,
    @Default([]) List<NaznachenieIdData> medicalHistory,
    @Default({}) Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
    @Default({}) Map<String, List<String>> medicalHistoryDrugNames,
    @Default({}) Map<String, MedicineTakingModel> medicalHistoryDrugs,
  }) = _PurposeState;
}
