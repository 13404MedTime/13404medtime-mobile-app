import '../my_appointments/my_appointments_response.dart';

class TWHResponse {
  TWHResponse({
    this.twhList,
  });

  TWHResponse.fromJson(Map json) {
    List data = [];
    if (json['data']['data']['data'] is List) {
      data = json['data']['data']['data'];
    }
    twhList = data.isNotEmpty
        ? List.generate(
            data.length,
            (index) => TWHModel.fromJson(data[index]),
          )
        : [];
  }

  List<TWHModel>? twhList;
}

class TWHModel {
  TWHModel({
    this.date,
    this.averageBmi,
    this.bodyTemperature,
    this.clientsId,
    this.clientsIdData,
    this.guid,
    this.height,
    this.weight,
  });

  TWHModel.fromJson(Map json) {
    averageBmi = json['average_bmi'];
    bodyTemperature = json['body_temperature'];
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null
        ? ClientIdData.fromJson(json['cleints_id_data'])
        : null;
    date = json['date'];
    guid = json['guid'];
    height = json['height'];
    weight = json['weight'];
  }

  String? clientsId;
  ClientIdData? clientsIdData;
  String? date;
  String? guid;
  num? averageBmi;
  num? bodyTemperature;
  num? height;
  num? weight;
}
