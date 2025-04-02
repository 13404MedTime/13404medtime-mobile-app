class SubscriptionTypesResponse {
  SubscriptionTypesResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  SubscriptionTypesResponse.fromJson(Map<String, dynamic> json) {
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
  Data({
    this.status,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? SubscriptionsData.fromJson(json['data']) : null;
  }

  String? status;
  SubscriptionsData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SubscriptionsData {
  SubscriptionsData({this.subscriptions});

  SubscriptionsData.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      subscriptions = <SubscriptionItem>[];
      json['message'].forEach((v) {
        subscriptions!.add(SubscriptionItem.fromJson(v));
      });
    }
  }

  List<SubscriptionItem>? subscriptions;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subscriptions != null) {
      data['message'] = subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubscriptionItem {
  SubscriptionItem({
    this.afterPriceText,
    this.consultationCount,
    this.description,
    this.endDate,
    this.features,
    this.guid,
    this.price,
    this.subscriptionName,
  });

  SubscriptionItem.fromJson(Map<String, dynamic> json) {
    afterPriceText = json['after_price_text'];
    consultationCount = json['consultation_count'];
    description = json['description'];
    endDate = json['end_date'];
    features = json['features'].cast<String>();
    guid = json['guid'];
    price = json['price'];
    subscriptionName = json['subscribtion_name'];
  }

  String? afterPriceText;
  int? consultationCount;
  String? description;
  String? endDate;
  List<String>? features;
  String? guid;
  int? price;
  String? subscriptionName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['after_price_text'] = afterPriceText;
    data['consultation_count'] = consultationCount;
    data['description'] = description;
    data['end_date'] = endDate;
    data['features'] = features;
    data['guid'] = guid;
    data['price'] = price;
    data['subscribtion_name'] = subscriptionName;
    return data;
  }
}
