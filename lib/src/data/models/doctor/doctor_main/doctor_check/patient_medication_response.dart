class PatientMedicationResponse {
  const PatientMedicationResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory PatientMedicationResponse.fromJson(Map<String, dynamic> json) => PatientMedicationResponse(
        status: json['status'] ?? '',
        description: json['description'] ?? '',
        data: Data.fromJson(json['data'] ?? {}),
        customMessage: json['custom_message'] ?? '',
      );
  final String status;
  final String description;
  final Data data;
  final String customMessage;
}

class Data {
  const Data({
    required this.tableSlug,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tableSlug: json['table_slug'] ?? '',
        data: DataContent.fromJson(json['data'] ?? {}),
      );
  final String tableSlug;
  final DataContent data;
}

class DataContent {
  const DataContent({
    required this.count,
    required this.response,
  });

  factory DataContent.fromJson(Map<String, dynamic> json) => DataContent(
        count: json['count'] ?? 0,
        response: (json['response'] as List?)?.map((e) => ResponseItem.fromJson(e ?? {})).toList() ?? [],
      );
  final int count;
  final List<ResponseItem> response;
}

class ResponseItem {
  const ResponseItem({
    required this.beforeAfterFood,
    required this.clientsId,
    required this.clientsIdData,
    required this.count,
    required this.defaultNumber,
    required this.guid,
    required this.isFromPatient,
    required this.isTake,
    required this.medicineTakingId,
    required this.medicineTakingIdData,
    required this.naznachenieId,
    required this.preparatName,
    required this.preparatiId,
    required this.preparatiIdData,
    required this.timeTake,
  });

  factory ResponseItem.fromJson(Map<String, dynamic> json) => ResponseItem(
        beforeAfterFood: json['before_after_food'] ?? '',
        clientsId: json['cleints_id'] ?? '',
        clientsIdData: ClientData.fromJson(json['cleints_id_data'] ?? {}),
        count: json['count'] ?? 0,
        defaultNumber: json['default_number'] ?? 0,
        guid: json['guid'] ?? '',
        isFromPatient: json['is_from_patient'] ?? false,
        isTake: json['is_take'] ?? false,
        medicineTakingId: json['medicine_taking_id'] ?? '',
        medicineTakingIdData: MedicineTakingData.fromJson(json['medicine_taking_id_data'] ?? {}),
        naznachenieId: json['naznachenie_id'] ?? '',
        preparatName: json['preparat_name'] ?? '',
        preparatiId: json['preparati_id'] ?? '',
        preparatiIdData: PreparatiData.fromJson(json['preparati_id_data'] ?? {}),
        timeTake: json['time_take'] ?? '',
      );
  final String beforeAfterFood;
  final String clientsId;
  final ClientData clientsIdData;
  final int count;
  final int defaultNumber;
  final String guid;
  final bool isFromPatient;
  final bool isTake;
  final String medicineTakingId;
  final MedicineTakingData medicineTakingIdData;
  final String naznachenieId;
  final String preparatName;
  final String preparatiId;
  final PreparatiData preparatiIdData;
  final String timeTake;
}

// Define ClientData, MedicineTakingData, and PreparatiData similarly

class ClientData {
  const ClientData({
    required this.fullName,
    required this.phone,
    required this.height,
    required this.weight,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) => ClientData(
        fullName: json['full_name'] ?? '',
        phone: json['phone'] ?? '',
        height: (json['height'] ?? 0).toDouble(),
        weight: (json['weight'] ?? 0).toDouble(),
      );
  final String fullName;
  final String phone;
  final double height;
  final double weight;
}

class MedicineTakingData {
  const MedicineTakingData({
    required this.medicineName,
    required this.dosage,
  });

  factory MedicineTakingData.fromJson(Map<String, dynamic> json) => MedicineTakingData(
        medicineName: json['medicine_name'] ?? '',
        dosage: json['dosage'] ?? 0,
      );
  final String medicineName;
  final int dosage;
}

class PreparatiData {
  const PreparatiData({
    required this.brandName,
    required this.dosageForm,
  });

  factory PreparatiData.fromJson(Map<String, dynamic> json) => PreparatiData(
        brandName: json['brand_name'] ?? '',
        dosageForm: json['dosage_form'] ?? '',
      );
  final String brandName;
  final String dosageForm;
}
