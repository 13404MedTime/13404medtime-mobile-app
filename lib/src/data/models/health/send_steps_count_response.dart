class SendStepsCountResponse {
  SendStepsCountResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  SendStepsCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? StepsData.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  StepsData? data;
  String? customMessage;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['custom_message'] = customMessage;
    return data;
  }
}

class StepsData {
  StepsData({this.status, this.data});
  StepsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Data({this.message});
  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Message? message;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  Message({this.cleintsId, this.date, this.distance, this.guid, this.hour, this.id, this.minutes, this.stepCount});

  Message.fromJson(Map<String, dynamic> json) {
    cleintsId = json['cleints_id'];
    date = json['date'];
    distance = json['distance'];
    guid = json['guid'];
    hour = json['hour'];
    id = json['id'];
    minutes = json['minutes'];
    stepCount = json['step_count'];
  }

  String? cleintsId;
  String? date;
  num? distance;
  String? guid;
  num? hour;
  String? id;
  num? minutes;
  num? stepCount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cleints_id'] = cleintsId;
    data['date'] = date;
    data['distance'] = distance;
    data['guid'] = guid;
    data['hour'] = hour;
    data['id'] = id;
    data['minutes'] = minutes;
    data['step_count'] = stepCount;
    return data;
  }
}
