part of 'disease_history_bloc.dart';

@freezed
class DiseaseHistoryState with _$DiseaseHistoryState {
  const factory DiseaseHistoryState({
    @Default(false) bool isLoading,
    @Default(false) bool isScrollLoading,
    @Default('') String searchText,
    @Default([]) List<NaznachenieIdData> diseaseItemsList,
    @Default({}) Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
    @Default({}) Map<String, List<String>> medicalHistoryDrugNames,
    @Default({}) Map<String, MedicineTakingModel> medicalHistoryDrugs,
    @Default([]) List<SearchAppointResponse> searchedAppoints,
    @Default([]) List<DoctorIdData> searchedDoctors,
    @Default([]) List<DoctorTypeModel> searchedCategory,
    @Default(SearchStatus.initial) SearchStatus searchStatus,
  }) = _DiseaseHistoryState;
}
