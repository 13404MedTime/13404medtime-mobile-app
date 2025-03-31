class CheckForProductionResponse {
  CheckForProductionResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  CheckForProductionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  Data? data;
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

class Data {
  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null && json['data']['response'] is List ? ProductionStatusData.fromJson(json['data']) : null;
  }

  ProductionStatusData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductionStatusData {
  ProductionStatusData({this.response});

  ProductionStatusData.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? DataResponse.fromJson(json['response'][0]) : null;
  }

  DataResponse? response;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class DataResponse {
  DataResponse({
    this.guid,
    this.status,
  });

  DataResponse.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    status = json['status'];
  }

  String? guid;
  bool? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['status'] = status;
    return data;
  }
}
