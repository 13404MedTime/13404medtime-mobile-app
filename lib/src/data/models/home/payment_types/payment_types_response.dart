class PaymentTypesResponse {
  PaymentTypesResponse({
    this.status,
    this.description,
    this.data,
  });

  PaymentTypesResponse.fromJson(Map<String, dynamic> json) {
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
    data = json['data'] != null ? PaymentTypesData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  PaymentTypesData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaymentTypesData {
  PaymentTypesData({
    this.count,
    this.response,
  });

  PaymentTypesData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <PaymentItem>[];
      json['response'].forEach((v) {
        response!.add(PaymentItem.fromJson(v));
      });
    }
  }

  int? count;
  List<PaymentItem>? response;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentItem {
  PaymentItem({
    this.guid,
    this.image,
    this.name,
    this.url,
  });

  PaymentItem.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    image = json['image'];
    name = json['name'];
    url = json['url'];
  }

  String? guid;
  String? image;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['image'] = image;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
