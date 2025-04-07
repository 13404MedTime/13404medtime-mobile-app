import '../my_appointments/my_appointments_response.dart';

class MedicationResponse {
  MedicationResponse.fromJson(Map json) {
    medications = json['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['response'] as List).length,
            (index) => MyAppointModel.fromJson((json['data']['data']['response'] as List)[index]),
          )
        : null;
  }

  List<MyAppointModel>? medications;
}

class MedicineTakingIdData {
  MedicineTakingIdData({
    this.cardioappAutomedicinetakingDisable,
    this.preparatiIdData,
    this.cleintsId,
    this.comment,
    this.guid,
    this.jsonBody,
    this.naznachenieId,
    this.number,
    this.preparatiId,
    this.medicineName,
  });

  MedicineTakingIdData.fromJson(Map json) {
    // amountMedicine = json['amount_medicine'];
    // amountMedicineTake = json['amount_medicine_take'];
    if (json['preparati_id_data'] != null) {
      preparatiIdData = PreparatiIdData.fromJson(json['preparati_id_data']);
    }
    cardioappAutomedicinetakingDisable = json['cardioapp-automedicinetaking_disable'];
    cleintsId = json['cleints_id'];
    comment = json['comment'];
    guid = json['guid'];
    jsonBody = json['json_body'];
    naznachenieId = json['naznachenie_id'];
    number = json['number'];
    preparatiId = json['preparati_id'];
    medicineName = json['medicine_name'];
  }

  // String? amountMedicine;
  // int? amountMedicineTake;
  bool? cardioappAutomedicinetakingDisable;
  PreparatiIdData? preparatiIdData;
  String? cleintsId;
  String? comment;
  String? medicineName;
  String? guid;
  String? jsonBody;
  String? naznachenieId;
  int? number;
  String? preparatiId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineTakingIdData &&
          runtimeType == other.runtimeType &&
          // amountMedicine == other.amountMedicine &&
          // amountMedicineTake == other.amountMedicineTake &&
          cardioappAutomedicinetakingDisable == other.cardioappAutomedicinetakingDisable &&
          cleintsId == other.cleintsId &&
          comment == other.comment &&
          guid == other.guid &&
          jsonBody == other.jsonBody &&
          naznachenieId == other.naznachenieId &&
          number == other.number &&
          preparatiId == other.preparatiId;

  @override
  int get hashCode =>
      // amountMedicine.hashCode ^
      // amountMedicineTake.hashCode ^
      cardioappAutomedicinetakingDisable.hashCode ^
      cleintsId.hashCode ^
      comment.hashCode ^
      guid.hashCode ^
      jsonBody.hashCode ^
      naznachenieId.hashCode ^
      number.hashCode ^
      preparatiId.hashCode;
}
