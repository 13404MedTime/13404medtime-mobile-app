part of 'disease_history_bloc.dart';

@freezed
class DiseaseHistoryEvent with _$DiseaseHistoryEvent {
  const factory DiseaseHistoryEvent.started({
    required List<NaznachenieIdData> diseaseItemsList,
    required Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
    required Map<String, MedicineTakingModel> medicalHistoryDrugs,
    required Map<String, List<String>> medicalHistoryDrugNames,
  }) = Started;

  const factory DiseaseHistoryEvent.getSearchedItems({required String searchedItem}) = GetSearchedItemsEvent;

  const factory DiseaseHistoryEvent.scrollGetList() = ScrollGetListEvent;
}
