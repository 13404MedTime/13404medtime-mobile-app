import '../../my_appointments/my_appointments_response.dart';

class FavouriteDoctorResponse {
  FavouriteDoctorResponse({
    this.status,
    this.description,
    this.data,
  });

  FavouriteDoctorResponse.fromJson(Map json) {
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

  Data.fromJson(Map json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? FavouriteDoctorData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  FavouriteDoctorData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class FavouriteDoctorData {
  FavouriteDoctorData({
    this.count,
    this.response,
  });

  FavouriteDoctorData.fromJson(Map json) {
    count = json['count'];
    if (json['response'] != null) {
      response = [];
      // ignore: inference_failure_on_untyped_parameter
      json['response'].forEach((v) {
        response?.add(DoctorIdData.fromJson(v['doctor_id_data'] ?? {}));
      });
    }
  }

  num? count;
  List<DoctorIdData>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    // if (response != null) {
    //   map['response'] = response?.map((v) => v.toJson()).toList();
    // }
    return map;
  }
}

class FavouriteDoctorMainResponse {
  FavouriteDoctorMainResponse({
    this.cleintsId,
    this.cleintsIdData,
    this.doctorId,
    this.doctorIdData,
    this.guid,
    this.isFavourite,
  });

  FavouriteDoctorMainResponse.fromJson(Map json) {
    cleintsId = json['cleints_id'];
    cleintsIdData = json['cleints_id_data'] != null ? CleintsIdData.fromJson(json['cleints_id_data']) : null;
    doctorId = json['doctor_id'];
    doctorIdData = json['doctor_id_data'] != null ? DoctorIdData.fromJson(json['doctor_id_data']) : null;
    guid = json['guid'];
    isFavourite = json['is_favourite'];
  }

  String? cleintsId;
  CleintsIdData? cleintsIdData;
  String? doctorId;
  DoctorIdData? doctorIdData;
  String? guid;
  bool? isFavourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleints_id'] = cleintsId;
    if (cleintsIdData != null) {
      map['cleints_id_data'] = cleintsIdData?.toJson();
    }
    map['doctor_id'] = doctorId;
    // if (doctorIdData != null) {
    //   map['doctor_id_data'] = doctorIdData?.toJson();
    // }
    map['guid'] = guid;
    map['is_favourite'] = isFavourite;
    return map;
  }
}

// class DoctorIdData {
//   DoctorIdData({
//     this.v,
//     this.id,
//     this.cardioappusertouserDisable,
//     this.categoryId,
//     this.categoryId2,
//     this.desc,
//     this.doctorName,
//     this.experience,
//     this.guid,
//     this.hospital,
//     this.login,
//     this.medicPhoto,
//     this.password,
//     this.phoneNumber,
//     this.telegramNick,
//   });
//
//   DoctorIdData.fromJson(Map json) {
//     v = json['__v'];
//     id = json['_id'];
//     cardioappusertouserDisable = json['cardioapp-usertouser_disable'];
//     categoryId = json['category_id'];
//     categoryId2 = json['category_id_2'];
//     desc = json['desc'];
//     doctorName = json['doctor_name'];
//     experience = json['experience'];
//     guid = json['guid'];
//     hospital = json['hospital'];
//     login = json['login'];
//     medicPhoto = json['medic_photo'];
//     password = json['password'];
//     phoneNumber = json['phone_number'];
//     telegramNick = json['telegram_nick'];
//   }
//
//   num? v;
//   dynamic id;
//   bool? cardioappusertouserDisable;
//   String? categoryId;
//   String? categoryId2;
//   String? desc;
//   String? doctorName;
//   num? experience;
//   String? guid;
//   String? hospital;
//   String? login;
//   String? medicPhoto;
//   String? password;
//   String? phoneNumber;
//   String? telegramNick;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['__v'] = v;
//     map['_id'] = id;
//     map['cardioapp-usertouser_disable'] = cardioappusertouserDisable;
//     map['category_id'] = categoryId;
//     map['category_id_2'] = categoryId2;
//     map['desc'] = desc;
//     map['doctor_name'] = doctorName;
//     map['experience'] = experience;
//     map['guid'] = guid;
//     map['hospital'] = hospital;
//     map['login'] = login;
//     map['medic_photo'] = medicPhoto;
//     map['password'] = password;
//     map['phone_number'] = phoneNumber;
//     map['telegram_nick'] = telegramNick;
//     return map;
//   }
// }

class CleintsIdData {
  CleintsIdData({
    this.v,
    this.id,
    this.adres,
    this.amountDoctors,
    this.amountMedicine,
    this.amountVisits,
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

  CleintsIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    adres = json['adres'];
    amountDoctors = json['amount_doctors'];
    amountMedicine = json['amount_medicine'];
    amountVisits = json['amount_visits'];
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
  num? amountDoctors;
  num? amountMedicine;
  num? amountVisits;
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
    map['amount_doctors'] = amountDoctors;
    map['amount_medicine'] = amountMedicine;
    map['amount_visits'] = amountVisits;
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
}
