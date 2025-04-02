class SubscriptionDetailsResponse {
  SubscriptionDetailsResponse({
    this.status,
    this.description,
    this.data,
  });

  SubscriptionDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SubscriptionDetailsData.fromJson(json['data']) : null;
  }

  SubscriptionDetailsData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SubscriptionDetailsData {
  SubscriptionDetailsData({this.response});

  SubscriptionDetailsData.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? SubscriptionDetails.fromJson(json['response']) : null;
  }

  SubscriptionDetails? response;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class SubscriptionDetails {
  SubscriptionDetails({
    this.afterPriceText,
    this.count,
    this.description,
    this.descriptionFeatures,
    this.guid,
    this.image,
    this.name,
    this.popupDescription,
    this.price,
    this.status,
    this.test,
  });

  SubscriptionDetails.fromJson(Map<String, dynamic> json) {
    afterPriceText = json['after_price_text'];
    count = json['count'];
    description = json['description'];
    descriptionFeatures = json['description_features'];
    guid = json['guid'];
    image = json['image'];
    name = json['name'];
    popupDescription = json['popup_description'];
    price = json['price'];
    status = json['status'].cast<String>();
    test = json['test'];
  }

  String? afterPriceText;
  int? count;
  String? description;
  String? descriptionFeatures;
  String? guid;
  String? image;
  String? name;
  String? popupDescription;
  int? price;
  List<String>? status;
  String? test;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['after_price_text'] = afterPriceText;
    data['count'] = count;
    data['description'] = description;
    data['description_features'] = descriptionFeatures;
    data['guid'] = guid;
    data['image'] = image;
    data['name'] = name;
    data['popup_description'] = popupDescription;
    data['price'] = price;
    data['status'] = status;
    data['test'] = test;
    return data;
  }
}
