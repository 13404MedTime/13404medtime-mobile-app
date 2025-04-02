import 'package:flutter/foundation.dart';

class SearchAppointmentsResponse {
  SearchAppointmentsResponse({
    this.count,
    this.myAppointments,
  });

  SearchAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    count = json['data']['data']['count'];
    try {
      myAppointments = json['data']['data']['response'] is List
          ? List.generate(
              (json['data']['data']['response'] as List?)?.length ?? 0,
              (index) => SearchAppointResponse.fromJson((json['data']['data']['response'] as List)[index]),
            )
          : null;
    } on Exception catch (e, s) {
      debugPrint('e: $e | $s');
    }
  }

  int? count;
  List<SearchAppointResponse>? myAppointments;
}

class SearchAppointResponse {
  SearchAppointResponse({
    this.amount,
    this.amountMedTaken,
    this.cardioappPatientvisitsDisable,
    this.cardioappUpdatepatientvisitsDisable,
    this.cleintsId,
    this.cleintsIdData,
    this.comment,
    this.createdTime,
    this.defaultNumber,
    this.doctorId,
    this.doctorData,
    this.guid,
    this.illId,
    this.illIdData,
    this.illName,
    // this.patientVisitsIds,
  });

  SearchAppointResponse.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    amountMedTaken = json['amount_med_taken'];
    cardioappPatientvisitsDisable = json['cardioapp-patientvisits_disable'];
    cardioappUpdatepatientvisitsDisable = json['cardioapp-updatepatientvisits_disable'];
    cleintsId = json['cleints_id'];
    cleintsIdData = json['cleints_id_data'] != null ? CleintsIdData.fromJson(json['cleints_id_data']) : null;
    comment = json['comment'];
    createdTime = json['created_time'];
    defaultNumber = json['default_number'];
    doctorId = json['doctor_id'];
    doctorData = json['doctor_id_data'] != null ? DoctorData.fromJson(json['doctor_id_data']) : null;
    guid = json['guid'];
    illId = json['ill_id'];
    illIdData = json['ill_id_data'] != null ? IllIdData.fromJson(json['ill_id_data']) : null;
    illName = json['ill_name'];
    // patientVisitsIds = json['patient_visits_ids'].cast<String>();
  }
  int? amount;
  int? amountMedTaken;
  bool? cardioappPatientvisitsDisable;
  bool? cardioappUpdatepatientvisitsDisable;
  String? cleintsId;
  CleintsIdData? cleintsIdData;
  String? comment;
  String? createdTime;
  int? defaultNumber;
  String? doctorId;
  DoctorData? doctorData;
  String? guid;
  String? illId;
  IllIdData? illIdData;
  String? illName;
  // List<String>? patientVisitsIds;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['amount_med_taken'] = amountMedTaken;
    data['cardioapp-patientvisits_disable'] = cardioappPatientvisitsDisable;
    data['cardioapp-updatepatientvisits_disable'] = cardioappUpdatepatientvisitsDisable;
    data['cleints_id'] = cleintsId;
    if (cleintsIdData != null) {
      data['cleints_id_data'] = cleintsIdData!.toJson();
    }
    data['comment'] = comment;
    data['created_time'] = createdTime;
    data['default_number'] = defaultNumber;
    data['doctor_id'] = doctorId;
    if (doctorData != null) {
      data['doctor_id_data'] = doctorData!.toJson();
    }
    data['guid'] = guid;
    data['ill_id'] = illId;
    if (illIdData != null) {
      data['ill_id_data'] = illIdData!.toJson();
    }
    data['ill_name'] = illName;
    // data['patient_visits_ids'] = patientVisitsIds;
    return data;
  }
}

class CleintsIdData {
  CleintsIdData(
      {this.iV,
      this.adres,
      this.amountDoctors,
      this.amountMedicine,
      this.amountVisits,
      // this.avarageDistance,
      this.avarageHeart,
      this.bestDistance,
      // this.bestTime,
      this.birthDate,
      this.bloodGroup,
      this.cardioappCreatehealthparentsDisable,
      this.cleintLang,
      this.cleintLastname,
      this.clientName,
      this.fcmToken,
      this.guid,
      this.pasport,
      this.phoneNumber,
      this.userNumberId});

  CleintsIdData.fromJson(Map<String, dynamic> json) {
    iV = json['__v'];
    adres = json['adres'];
    amountDoctors = json['amount_doctors'];
    amountMedicine = json['amount_medicine'];
    amountVisits = json['amount_visits'];
    // avarageDistance = json['avarage_distance'];
    avarageHeart = json['avarage_heart'];
    bestDistance = json['best_distance'];
    // bestTime = json['best_time'];
    birthDate = json['birth_date'];
    bloodGroup = json['blood_group'];
    cardioappCreatehealthparentsDisable = json['cardioapp-createhealthparents_disable'];
    cleintLang = json['cleint_lang'];
    cleintLastname = json['cleint_lastname'];
    clientName = json['client_name'];
    fcmToken = json['fcm_token'];
    guid = json['guid'];
    pasport = json['pasport'];
    phoneNumber = json['phone_number'];
    userNumberId = json['user_number_id'];
  }
  int? iV;
  String? adres;
  int? amountDoctors;
  int? amountMedicine;
  int? amountVisits;
  // num? avarageDistance;
  num? avarageHeart;
  int? bestDistance;
  // double? bestTime;
  String? birthDate;
  String? bloodGroup;
  bool? cardioappCreatehealthparentsDisable;
  String? cleintLang;
  String? cleintLastname;
  String? clientName;
  String? fcmToken;
  String? guid;
  String? pasport;
  String? phoneNumber;
  String? userNumberId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__v'] = iV;
    data['adres'] = adres;
    data['amount_doctors'] = amountDoctors;
    data['amount_medicine'] = amountMedicine;
    data['amount_visits'] = amountVisits;
    // data['avarage_distance'] = avarageDistance;
    data['avarage_heart'] = avarageHeart;
    data['best_distance'] = bestDistance;
    // data['best_time'] = bestTime;
    data['birth_date'] = birthDate;
    data['blood_group'] = bloodGroup;
    data['cardioapp-createhealthparents_disable'] = cardioappCreatehealthparentsDisable;
    data['cleint_lang'] = cleintLang;
    data['cleint_lastname'] = cleintLastname;
    data['client_name'] = clientName;
    data['fcm_token'] = fcmToken;
    data['guid'] = guid;
    data['pasport'] = pasport;
    data['phone_number'] = phoneNumber;
    data['user_number_id'] = userNumberId;
    return data;
  }
}

class DoctorData {
  DoctorData(
      {this.iV,
      this.cardioappUsertouserDisable,
      this.categoryId,
      this.categoryId2,
      this.desc,
      this.doctorName,
      this.experience,
      this.guid,
      this.hospital,
      this.login,
      this.medicPhoto,
      this.password,
      this.phoneNumber,
      this.telegramNick});

  DoctorData.fromJson(Map<String, dynamic> json) {
    iV = json['__v'];
    cardioappUsertouserDisable = json['cardioapp-usertouser_disable'];
    categoryId = json['category_id'];
    categoryId2 = json['category_id_2'];
    desc = json['desc'];
    doctorName = json['doctor_name'];
    experience = json['experience'];
    guid = json['guid'];
    hospital = json['hospital'];
    login = json['login'];
    medicPhoto = json['medic_photo'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    telegramNick = json['telegram_nick'];
  }
  int? iV;
  bool? cardioappUsertouserDisable;
  String? categoryId;
  String? categoryId2;
  String? desc;
  String? doctorName;
  int? experience;
  String? guid;
  String? hospital;
  String? login;
  String? medicPhoto;
  String? password;
  String? phoneNumber;
  String? telegramNick;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__v'] = iV;
    data['cardioapp-usertouser_disable'] = cardioappUsertouserDisable;
    data['category_id'] = categoryId;
    data['category_id_2'] = categoryId2;
    data['desc'] = desc;
    data['doctor_name'] = doctorName;
    data['experience'] = experience;
    data['guid'] = guid;
    data['hospital'] = hospital;
    data['login'] = login;
    data['medic_photo'] = medicPhoto;
    data['password'] = password;
    data['phone_number'] = phoneNumber;
    data['telegram_nick'] = telegramNick;
    return data;
  }
}

class IllIdData {
  IllIdData({this.iV, this.guid, this.illnessName});

  IllIdData.fromJson(Map<String, dynamic> json) {
    iV = json['__v'];
    guid = json['guid'];
    illnessName = json['illness_name'];
  }
  int? iV;
  String? guid;
  String? illnessName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__v'] = iV;
    data['guid'] = guid;
    data['illness_name'] = illnessName;
    return data;
  }
}
