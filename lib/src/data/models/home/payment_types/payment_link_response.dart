class PaymentLinkResponse {
  PaymentLinkResponse({
    this.status,
    this.description,
    this.data,
  });

  PaymentLinkResponse.fromJson(Map<String, dynamic> json) {
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
  Data({
    this.status,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? PaymentLinkData.fromJson(json['data']) : null;
  }

  String? status;
  PaymentLinkData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaymentLinkData {
  PaymentLinkData({
    this.response,
  });

  PaymentLinkData.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <PaymentResponse>[];
      json['response'].forEach((v) {
        response!.add(PaymentResponse.fromJson(v));
      });
    }
  }

  List<PaymentResponse>? response;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentResponse {
  PaymentResponse({this.link});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }

  String? link;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    return data;
  }
}
