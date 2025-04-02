import '../../my_appointments/my_appointments_response.dart';

class GetVisitsResponse {
  GetVisitsResponse({
    this.myVisits,
  });

  GetVisitsResponse.fromJson(Map json) {
    myVisits = json['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['response'] as List).length,
            (index) => MyVisitModel.fromJson((json['data']['data']['response'] as List)[index]),
          )
        : [];
  }

  List<MyVisitModel>? myVisits;

  Map<String, dynamic> toJson() => {};
}

class MyVisitModel {
  MyVisitModel({
    this.amountMedicationTaken,
    this.clientsId,
    this.clientsIdData,
    this.date,
    this.defaultNumber,
    this.doctorId,
    this.doctorIdData,
    this.guid,
    this.naznachenieIds,
    this.visitCount,
  });

  MyVisitModel.fromJson(Map json) {
    amountMedicationTaken = json['amount_medication_taken'] is num
        ? (json['amount_medication_taken'] as num).toInt()
        : int.tryParse(json['amount_medication_taken'].toString()) ?? 0;
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    date = json['date'];
    defaultNumber = json['default_number'];
    doctorId = json['doctor_id'];
    doctorIdData = json['doctor_id_data'] != null ? DoctorIdData.fromJson(json['doctor_id_data']) : null;
    guid = json['guid'];
    naznachenieIds = json['naznachenie_ids'] is List
        ? List.generate((json['naznachenie_ids'] as List).length, (index) => (json['naznachenie_ids'] as List)[index])
        : null;
    visitCount = json['visit_count'];
  }

  int? amountMedicationTaken;
  String? clientsId;
  ClientIdData? clientsIdData;
  String? date;
  int? defaultNumber;
  String? doctorId;
  DoctorIdData? doctorIdData;
  String? guid;
  List<String>? naznachenieIds;
  int? visitCount;
}
