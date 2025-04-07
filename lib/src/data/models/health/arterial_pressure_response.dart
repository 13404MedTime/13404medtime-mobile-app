import '../my_appointments/my_appointments_response.dart';

class ArterialPressureResponse {
  ArterialPressureResponse({
    this.arterialPressureList,
  });

  ArterialPressureResponse.fromJson(Map json) {
    List data = [];
    if (json['data']['data']['data'] is List) {
      data = json['data']['data']['data'];
    }
    arterialPressureList = data.isNotEmpty
        ? List.generate(
            data.length,
            (index) => ArterialPressureModel.fromJson(data[index]),
          )
        : [];
  }

  List<ArterialPressureModel>? arterialPressureList;
}

class ArterialPressureModel {
  ArterialPressureModel({
    this.clientsId,
    this.clientsIdData,
    this.date,
    this.diastolicheskoe,
    this.guid,
    this.patientCardsId,
    this.pulse,
    this.sistolicheskoe,
  });

  ArterialPressureModel.fromJson(Map json) {
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    date = json['date'];
    guid = json['guid'];
    patientCardsId = json['patient_cards_id'];
    diastolicheskoe = json['diastolicheskoe'];
    pulse = json['puls'];
    sistolicheskoe = json['sistolicheskoe'];
  }

  String? clientsId;
  ClientIdData? clientsIdData;
  String? date;
  String? guid;
  String? patientCardsId;
  num? diastolicheskoe;
  num? pulse;
  num? sistolicheskoe;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArterialPressureModel &&
          runtimeType == other.runtimeType &&
          clientsId == other.clientsId &&
          clientsIdData == other.clientsIdData &&
          date == other.date &&
          diastolicheskoe == other.diastolicheskoe &&
          guid == other.guid &&
          patientCardsId == other.patientCardsId &&
          pulse == other.pulse &&
          sistolicheskoe == other.sistolicheskoe;

  @override
  int get hashCode =>
      clientsId.hashCode ^
      clientsIdData.hashCode ^
      date.hashCode ^
      diastolicheskoe.hashCode ^
      guid.hashCode ^
      patientCardsId.hashCode ^
      pulse.hashCode ^
      sistolicheskoe.hashCode;
}
