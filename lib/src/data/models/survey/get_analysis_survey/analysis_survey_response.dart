class AnalysisSurveyResponse {
  AnalysisSurveyResponse({
    this.status,
    this.description,
    this.data,
  });

  AnalysisSurveyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  String? description;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? AnalysisSurveyData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  AnalysisSurveyData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class AnalysisSurveyData {
  AnalysisSurveyData({
    this.count,
    this.response,
  });

  AnalysisSurveyData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = [];
      // ignore: inference_failure_on_untyped_parameter
      json['response'].forEach((v) {
        response?.add(AnalysisSurveyMainResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<AnalysisSurveyMainResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AnalysisSurveyMainResponse {
  AnalysisSurveyMainResponse({
    this.cleintsId,
    this.cleintsIdData,
    this.date,
    this.fileTitle,
    this.file,
    this.guid,
    this.image,
  });

  AnalysisSurveyMainResponse.fromJson(Map<String, dynamic> json) {
    cleintsId = json['cleints_id'];
    cleintsIdData = json['cleints_id_data'] != null ? CleintsIdData.fromJson(json['cleints_id_data']) : null;
    date = json['date'];
    fileTitle = json['flie_title'];
    file = json['file'];
    guid = json['guid'];
    image = json['image'];
  }

  String? cleintsId;
  CleintsIdData? cleintsIdData;
  String? date;
  String? fileTitle;
  String? file;
  String? guid;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleints_id'] = cleintsId;
    if (cleintsIdData != null) {
      map['cleints_id_data'] = cleintsIdData?.toJson();
    }
    map['date'] = date;
    map['flie_title'] = fileTitle;
    map['file'] = file;
    map['guid'] = guid;
    map['image'] = image;
    return map;
  }

  @override
  String toString() => toJson().toString();
}

class CleintsIdData {
  CleintsIdData({
    this.v,
    this.id,
    this.adres,
    this.avarageDistance,
    this.avarageHeart,
    this.bestDistance,
    this.bestTime,
    this.birthDate,
    this.bloodGroup,
    this.cardioappcreatehealthparentsDisable,
    this.cleintLang,
    this.cleintLastname,
    this.clientName,
    this.fcmToken,
    this.guid,
    this.pasport,
    this.phoneNumber,
    this.userNumberId,
  });

  CleintsIdData.fromJson(Map<String, dynamic> json) {
    v = json['__v'];
    id = json['_id'];
    adres = json['adres'];
    avarageDistance = json['avarage_distance'];
    avarageHeart = json['avarage_heart'];
    bestDistance = json['best_distance'];
    bestTime = json['best_time'];
    birthDate = json['birth_date'];
    bloodGroup = json['blood_group'];
    cardioappcreatehealthparentsDisable = json['cardioapp-createhealthparents_disable'];
    cleintLang = json['cleint_lang'];
    cleintLastname = json['cleint_lastname'];
    clientName = json['client_name'];
    fcmToken = json['fcm_token'];
    guid = json['guid'];
    pasport = json['pasport'];
    phoneNumber = json['phone_number'];
    userNumberId = json['user_number_id'];
  }

  num? v;
  dynamic id;
  String? adres;
  num? avarageDistance;
  num? avarageHeart;
  num? bestDistance;
  num? bestTime;
  String? birthDate;
  String? bloodGroup;
  bool? cardioappcreatehealthparentsDisable;
  String? cleintLang;
  String? cleintLastname;
  String? clientName;
  String? fcmToken;
  String? guid;
  String? pasport;
  String? phoneNumber;
  String? userNumberId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['adres'] = adres;
    map['avarage_distance'] = avarageDistance;
    map['avarage_heart'] = avarageHeart;
    map['best_distance'] = bestDistance;
    map['best_time'] = bestTime;
    map['birth_date'] = birthDate;
    map['blood_group'] = bloodGroup;
    map['cardioapp-createhealthparents_disable'] = cardioappcreatehealthparentsDisable;
    map['cleint_lang'] = cleintLang;
    map['cleint_lastname'] = cleintLastname;
    map['client_name'] = clientName;
    map['fcm_token'] = fcmToken;
    map['guid'] = guid;
    map['pasport'] = pasport;
    map['phone_number'] = phoneNumber;
    map['user_number_id'] = userNumberId;
    return map;
  }

  @override
  String toString() => toJson().toString();
}
