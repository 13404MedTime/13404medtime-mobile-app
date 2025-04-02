class ProfileResponse {
  ProfileResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  ProfileResponse.fromJson(json) {
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
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['custom_message'] = customMessage;
    return map;
  }
}

class Data {
  Data({
    this.tableSlug,
    this.userData,
  });

  Data.fromJson(json) {
    tableSlug = json['table_slug'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  UserData? userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (userData != null) {
      map['data'] = userData?.toJson();
    }
    return map;
  }
}

class UserData {
  UserData({
    this.adres,
    this.bloodGroup,
    this.cleintLang,
    this.cleintLastname,
    this.clientName,
    this.fcmToken,
    this.guid,
    this.id,
    this.pasport,
    this.phoneNumber,
    this.userId,
    this.birthDate,
  });

  UserData.fromJson(json) {
    adres = json['adres'];
    bloodGroup = json['blood_group'];
    cleintLang = json['cleint_lang'];
    cleintLastname = json['cleint_lastname'];
    clientName = json['client_name'];
    fcmToken = json['fcm_token'];
    guid = json['guid'];
    id = json['id'];
    pasport = json['pasport'];
    phoneNumber = json['phone_number'];
    userId = json['user_id'];
    birthDate = json['birth_date'];
  }

  String? adres;
  String? bloodGroup;
  String? cleintLang;
  String? cleintLastname;
  String? clientName;
  String? fcmToken;
  String? guid;
  String? id;
  String? pasport;
  String? phoneNumber;
  String? birthDate;
  dynamic userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adres'] = adres;
    map['blood_group'] = bloodGroup;
    map['cleint_lang'] = cleintLang;
    map['cleint_lastname'] = cleintLastname;
    map['client_name'] = clientName;
    map['fcm_token'] = fcmToken;
    map['guid'] = guid;
    map['id'] = id;
    map['pasport'] = pasport;
    map['phone_number'] = phoneNumber;
    map['user_id'] = userId;
    map['birth_date'] = birthDate;
    return map;
  }
}
