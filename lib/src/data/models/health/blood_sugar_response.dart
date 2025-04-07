import '../my_appointments/my_appointments_response.dart';

class BloodSugarResponse {
  BloodSugarResponse({
    this.bloodSugarList,
  });

  BloodSugarResponse.fromJson(Map json) {
    List data = [];
    if (json['data']['data']['data'] is List) {
      data = json['data']['data']['data'];
    }
    bloodSugarList = data.isNotEmpty
        ? List.generate(
            data.length,
            (index) => BloodSugarModel.fromJson(data[index]),
          )
        : [];
  }

  List<BloodSugarModel>? bloodSugarList;
}

class BloodSugarModel {
  BloodSugarModel(
    this.clientsId,
    this.clientsIdData,
    this.date,
    this.guid,
    this.value,
  );

  BloodSugarModel.fromJson(Map json) {
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    date = json['date'];
    guid = json['guid'];
    value = json['value'];
  }

  String? clientsId;
  ClientIdData? clientsIdData;
  String? date;
  String? guid;
  num? value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BloodSugarModel &&
          runtimeType == other.runtimeType &&
          clientsId == other.clientsId &&
          clientsIdData == other.clientsIdData &&
          date == other.date &&
          guid == other.guid &&
          value == other.value;

  @override
  int get hashCode => clientsId.hashCode ^ clientsIdData.hashCode ^ date.hashCode ^ guid.hashCode ^ value.hashCode;
}
