class MedicineFullInfoResponse {
  const MedicineFullInfoResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory MedicineFullInfoResponse.fromJson(Map<String, dynamic> json) => MedicineFullInfoResponse(
        status: json['status'] as String? ?? '',
        description: json['description'] as String? ?? '',
        data: MedicineData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
        customMessage: json['custom_message'] as String? ?? '',
      );
  final String status;
  final String description;
  final MedicineData data;
  final String customMessage;
}

class MedicineData {
  const MedicineData({
    required this.tableSlug,
    required this.data,
  });

  factory MedicineData.fromJson(Map<String, dynamic> json) => MedicineData(
        tableSlug: json['table_slug'] as String? ?? '',
        data: MedicineDetails.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
      );
  final String tableSlug;
  final MedicineDetails data;
}

class MedicineDetails {
  const MedicineDetails({
    required this.count,
    required this.response,
  });

  factory MedicineDetails.fromJson(Map<String, dynamic> json) => MedicineDetails(
        count: json['count'] as int? ?? 0,
        response: (json['response'] as List<dynamic>?)
                ?.map((e) => MedicineResponse.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
  final int count;
  final List<MedicineResponse> response;
}

class MedicineResponse {
  const MedicineResponse({
    required this.amountMedicine,
    required this.amountMedicineTake,
    required this.cardioAppAutoMedicineTakingDisable,
    required this.cardioAppDeletePatientMedicineDisable,
    required this.clientsId,
    required this.clientsIdData,
    required this.currentAmount,
    required this.currentLeft,
    required this.description,
    required this.dosage,
    required this.frequency,
    required this.guid,
    required this.isFromPatient,
    required this.jsonBody,
    required this.lastTime,
    required this.medicineName,
    required this.naznachenieId,
    required this.naznachenieIdData,
    required this.number,
    required this.photo,
    required this.preparatiId,
    required this.unitOfMeasureId,
    required this.unitOfMeasureIdData,
    required this.weekDays,
  });

  factory MedicineResponse.fromJson(Map<String, dynamic> json) => MedicineResponse(
        amountMedicine: json['amount_medicine'] as int? ?? 0,
        amountMedicineTake: json['amount_medicine_take'] as int? ?? 0,
        cardioAppAutoMedicineTakingDisable: json['cardioapp-automedicinetaking_disable'] as bool? ?? false,
        cardioAppDeletePatientMedicineDisable: json['cardioapp-deletepatientmedicine_disable'] as bool? ?? false,
        clientsId: json['cleints_id'] as String? ?? '',
        clientsIdData: ClientData.fromJson(json['cleints_id_data'] as Map<String, dynamic>? ?? {}),
        currentAmount: json['current_amount'] as int? ?? 0,
        currentLeft: json['current_left'] as int? ?? 0,
        description: (json['description'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
        dosage: json['dosage'] as int? ?? 0,
        frequency: (json['frequency'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
        guid: json['guid'] as String? ?? '',
        isFromPatient: json['is_from_patient'] as bool? ?? false,
        jsonBody: json['json_body'] as String? ?? '',
        lastTime: json['last_time'] as String? ?? '',
        medicineName: json['medicine_name'] as String? ?? '',
        naznachenieId: json['naznachenie_id'] as String? ?? '',
        naznachenieIdData: NaznachenieData.fromJson(json['naznachenie_id_data'] as Map<String, dynamic>? ?? {}),
        number: json['number'] as int? ?? 0,
        photo: json['photo'] as String? ?? '',
        preparatiId: json['preparati_id'] as String? ?? '',
        unitOfMeasureId: json['unit_of_measure_id'] as String? ?? '',
        unitOfMeasureIdData: UnitOfMeasureData.fromJson(json['unit_of_measure_id_data'] as Map<String, dynamic>? ?? {}),
        weekDays: (json['week_days'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      );
  final int amountMedicine;
  final int amountMedicineTake;
  final bool cardioAppAutoMedicineTakingDisable;
  final bool cardioAppDeletePatientMedicineDisable;
  final String clientsId;
  final ClientData clientsIdData;
  final int currentAmount;
  final int currentLeft;
  final List<String> description;
  final int dosage;
  final List<String> frequency;
  final String guid;
  final bool isFromPatient;
  final String jsonBody;
  final String lastTime;
  final String medicineName;
  final String naznachenieId;
  final NaznachenieData naznachenieIdData;
  final int number;
  final String photo;
  final String preparatiId;
  final String unitOfMeasureId;
  final UnitOfMeasureData unitOfMeasureIdData;
  final List<String> weekDays;
}

class ClientData {
  const ClientData({
    required this.fullName,
    required this.height,
    required this.weight,
    required this.phone,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) => ClientData(
        fullName: json['full_name'] as String? ?? '',
        height: json['height'] as int? ?? 0,
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
        phone: json['phone'] as String? ?? '',
      );
  final String fullName;
  final int height;
  final double weight;
  final String phone;
}

class NaznachenieData {
  const NaznachenieData({
    required this.illName,
    required this.consultationType,
  });

  factory NaznachenieData.fromJson(Map<String, dynamic> json) => NaznachenieData(
        illName: json['ill_name'] as String? ?? '',
        consultationType: json['consultation_type'] as String? ?? '',
      );
  final String illName;
  final String consultationType;
}

class UnitOfMeasureData {
  const UnitOfMeasureData({
    required this.unitOfMeasureUz,
    required this.unitOfMeasureEng,
  });

  factory UnitOfMeasureData.fromJson(Map<String, dynamic> json) => UnitOfMeasureData(
        unitOfMeasureUz: json['unit_of_measure_uz'] as String? ?? '',
        unitOfMeasureEng: json['unit_of_measure_eng'] as String? ?? '',
      );
  final String unitOfMeasureUz;
  final String unitOfMeasureEng;
}
