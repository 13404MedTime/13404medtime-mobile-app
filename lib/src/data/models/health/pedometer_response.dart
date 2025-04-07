import '../my_appointments/my_appointments_response.dart';

class PedometerResponse {
  PedometerResponse({
    this.pedometerList,
  });

  PedometerResponse.fromJson(Map json) {
    List data = [];
    if (json['data']['data']['data'] is List) {
      data = json['data']['data']['data'];
    }
    pedometerList = data.isNotEmpty
        ? List.generate(
            data.length,
            (index) => PedometerModel.fromJson(data[index]),
          )
        : [];
  }

  List<PedometerModel>? pedometerList;
}

class PedometerModel {
  PedometerModel({
    this.clientsId,
    this.clientsIdData,
    this.date,
    this.distance,
    this.guid,
    this.hour,
    this.minutes,
    this.stepCount,
    // this.time,
  });

  PedometerModel.fromJson(Map json) {
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    date = json['date'];
    guid = json['guid'];
    distance = json['distance'] is String ? num.tryParse(json['distance']) ?? 0 : json['distance'];
    hour = json['hour'];
    minutes = json['minutes'];
    stepCount = json['step_count'];
    // time = json['time'];
  }

  String? clientsId;
  ClientIdData? clientsIdData;
  String? date;
  String? guid;
  num? distance;
  num? hour;
  num? minutes;
  num? stepCount;

  // num? time;

  @override
  String toString() => '$date ==> ($stepCount)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PedometerModel &&
          runtimeType == other.runtimeType &&
          clientsId == other.clientsId &&
          clientsIdData == other.clientsIdData &&
          date == other.date &&
          distance == other.distance &&
          guid == other.guid &&
          hour == other.hour &&
          minutes == other.minutes &&
          stepCount == other.stepCount;

  // time == other.time;

  @override
  int get hashCode =>
      clientsId.hashCode ^
      clientsIdData.hashCode ^
      date.hashCode ^
      distance.hashCode ^
      guid.hashCode ^
      hour.hashCode ^
      minutes.hashCode ^
      stepCount.hashCode;
// time.hashCode;
}
