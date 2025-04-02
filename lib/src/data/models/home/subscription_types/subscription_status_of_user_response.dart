class SubscriptionStatusOfUserResponse {
  SubscriptionStatusOfUserResponse({
    this.status,
    this.description,
    this.data,
  });

  SubscriptionStatusOfUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? SubscriptionStatusData.fromJson(json['data']) : null;
  }

  String? status;
  String? description;
  SubscriptionStatusData? data;

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

class SubscriptionStatusData {
  SubscriptionStatusData({this.tableSlug, this.data});

  SubscriptionStatusData.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? tableSlug;
  Data? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Data({this.count, this.response});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <SubscriptionStatus>[];
      json['response'].forEach((v) {
        response!.add(SubscriptionStatus.fromJson(v));
      });
    }
  }

  int? count;
  List<SubscriptionStatus>? response;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubscriptionStatus {
  SubscriptionStatus({
    this.cleintsId,
    this.consultationCount,
    this.endDate,
    this.guid,
    this.lastName,
    this.name,
    this.phoneNumber,
    this.purchaseDate,
    this.status,
    this.subscriptionTypesId,
    this.subscriptionTypesIdData,
    this.transactionsId,
  });

  SubscriptionStatus.fromJson(Map<String, dynamic> json) {
    cleintsId = json['cleints_id'];
    consultationCount = json['consultation_count'];
    endDate = json['end_date'];
    guid = json['guid'];
    lastName = json['last_name'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    purchaseDate = json['purchase_date'];
    status = json['status'].cast<String>();
    subscriptionTypesId = json['subscription_types_id'];
    subscriptionTypesIdData = json['subscription_types_id_data'] != null
        ? SubscriptionTypesIdData.fromJson(json['subscription_types_id_data'])
        : null;
    transactionsId = json['transactions_id'];
  }

  String? cleintsId;
  int? consultationCount;
  String? endDate;
  String? guid;
  String? lastName;
  String? name;
  String? phoneNumber;
  String? purchaseDate;
  List<String>? status;
  String? subscriptionTypesId;
  SubscriptionTypesIdData? subscriptionTypesIdData;
  String? transactionsId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cleints_id'] = cleintsId;
    data['consultation_count'] = consultationCount;
    data['end_date'] = endDate;
    data['guid'] = guid;
    data['last_name'] = lastName;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['purchase_date'] = purchaseDate;
    data['status'] = status;
    data['subscription_types_id'] = subscriptionTypesId;
    if (subscriptionTypesIdData != null) {
      data['subscription_types_id_data'] = subscriptionTypesIdData!.toJson();
    }
    data['transactions_id'] = transactionsId;
    return data;
  }
}

class SubscriptionTypesIdData {
  SubscriptionTypesIdData({
    this.afterPriceText,
    this.afterPriceTextUz,
    this.daysCount,
    this.description,
    this.descriptionUz,
    this.descriptionFeatures,
    this.name,
    this.nameUz,
    this.price,
  });

  SubscriptionTypesIdData.fromJson(Map<String, dynamic> json) {
    afterPriceText = json['after_price_text'];
    afterPriceTextUz = json['after_price_text_uz'];
    daysCount = json['days_count'];
    description = json['description'];
    descriptionUz = json['description_uz'];

    descriptionFeatures = json['description_features'] != null ? json['description_features'].cast<String>() : [];

    descriptionFeaturesUz =
        json['description_features_uz'] != null ? json['description_features_uz'].cast<String>() : [];
    name = json['name'];
    nameUz = json['name_uz'];
    price = json['price'];
  }

  String? afterPriceText;
  String? afterPriceTextUz;
  int? daysCount;
  String? description;
  String? descriptionUz;
  List<String>? descriptionFeatures;
  List<String>? descriptionFeaturesUz;
  String? name;
  String? nameUz;
  int? price;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['after_price_text'] = afterPriceText;
    data['after_price_text_uz'] = afterPriceTextUz;
    data['days_count'] = daysCount;
    data['description'] = description;
    data['description_uz'] = descriptionUz;
    data['description_features'] = descriptionFeatures;
    data['description_features_uz'] = descriptionFeaturesUz;
    data['name'] = name;
    data['name_uz'] = nameUz;
    data['price'] = price;
    return data;
  }
}
