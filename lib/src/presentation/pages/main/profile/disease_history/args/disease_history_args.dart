import '../../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../../../data/models/purpose/medication_times.dart';
import '../../../../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';

class DiseaseHistoryArgs {
  const DiseaseHistoryArgs({
    this.diseaseItemsList = const [],
    this.medicationTimes = const {},
    this.medicalHistoryDrugNames = const {},
    this.medicalHistoryDrugs = const {},
  });

  final List<NaznachenieIdData> diseaseItemsList;
  final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes;
  final Map<String, List<String>> medicalHistoryDrugNames;
  final Map<String, MedicineTakingModel> medicalHistoryDrugs;
}
