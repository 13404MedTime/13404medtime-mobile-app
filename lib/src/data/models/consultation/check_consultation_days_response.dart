class CheckConsultationDaysResponse {
  CheckConsultationDaysResponse({this.status, this.description, this.data});

  CheckConsultationDaysResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  String? description;
  Data? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? ConsultationDaysData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  ConsultationDaysData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ConsultationDaysData {
  ConsultationDaysData({this.count, this.response});

  ConsultationDaysData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <ConsultationDaysInfo>[];
      json['response'].forEach((v) {
        response!.add(ConsultationDaysInfo.fromJson(v));
      });
    }
  }

  int? count;
  List<ConsultationDaysInfo>? response;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConsultationDaysInfo {
  ConsultationDaysInfo({
    this.count,
    this.guid,
    this.name,
    this.price,
    this.consultationCount,
    this.subscriptionName,
    this.subscriptionNameUz,
    // this.status,
  });

  ConsultationDaysInfo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    guid = json['guid'];
    name = json['name'];
    price = json['price'];
    consultationCount = json['consultation_count'];
    subscriptionName = json['subscription_type'];
    subscriptionNameUz = json['subscription_type_uz'];
    // status = json['status'];
  }

  int? count;
  String? guid;
  String? name;
  int? price;
  int? consultationCount;
  String? subscriptionName;
  String? subscriptionNameUz;

  // List<String>? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['guid'] = guid;
    data['name'] = name;
    data['price'] = price;
    data['consultation_count'] = consultationCount;
    data['subscription_type'] = subscriptionName;
    data['subscription_type_uz'] = subscriptionNameUz;
    // data['status'] = status;
    return data;
  }
}
