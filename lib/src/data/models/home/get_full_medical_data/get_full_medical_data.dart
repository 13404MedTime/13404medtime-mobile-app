import '../../../../core/extension/extension.dart';

class GetFullMedicalDataResponse {
  GetFullMedicalDataResponse({
    this.medicalData,
  });

  GetFullMedicalDataResponse.fromJson(Map json) {
    medicalData = json['data']['data']['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['data']['data']['response'] as List).length,
            (index) => MedicalData2.fromJson((json['data']['data']['data']['data']['response'] as List)[index]),
          )
        : [];
  }

  List<MedicalData2>? medicalData;

  Map<String, dynamic> toJson() => {};
}

class MedicalData2 {
  MedicalData2({
    this.amount,
    this.amountMedTaken,
    this.cardioapppatientvisitsDisable,
    this.cardioappupdatepatientvisitsDisable,
    this.cleintsId,
    this.cleintsIdData,
    this.comment,
    this.createdTime,
    this.defaultNumber,
    this.doctorId,
    this.doctorIdData,
    this.guid,
    this.illId,
    this.illIdData,
    this.illName,
    this.incrementId,
    this.patientVisitsIds,
    this.preparatiIds,
    this.preparatisName,
    this.todayTimes,
  });

  MedicalData2.fromJson(json) {
    amount = json['amount'];
    amountMedTaken = json['amount_med_taken'];
    cardioapppatientvisitsDisable = json['cardioapp-patientvisits_disable'];
    cardioappupdatepatientvisitsDisable = json['cardioapp-updatepatientvisits_disable'];
    cleintsId = json['cleints_id'];
    cleintsIdData = json['cleints_id_data'] != null ? CleintsIdData2.fromJson(json['cleints_id_data']) : null;
    comment = json['comment'];
    createdTime = json['created_time'];
    defaultNumber = json['default_number'];
    doctorId = json['doctor_id'];
    doctorIdData = json['doctor_id_data'] != null ? DoctorIdData2.fromJson(json['doctor_id_data']) : null;
    guid = json['guid'];
    illId = json['ill_id'];
    illIdData = json['ill_id_data'] != null ? IllIdData2.fromJson(json['ill_id_data']) : null;
    if (json['preparatis_data'] != null) {
      preparatisData = [];
      json['preparatis_data'].forEach((v) {
        preparatisData?.add(PreparatisData2.fromJson(v));
      });
    }
    illName = json['ill_name'];
    incrementId = json['increment_id'];
    patientVisitsIds = json['patient_visits_ids'] != null ? json['patient_visits_ids'].cast<String>() : [];
    preparatiIds = json['preparati_ids'] != null ? json['preparati_ids'].cast<String>() : [];
    preparatisName = json['preparatis_name'] != null ? json['preparatis_name'].cast<String>() : [];
    if (json['today_times'] != null) {
      todayTimes = [];
      json['today_times'].forEach((v) {
        todayTimes?.add(Times2.fromJson(v));
      });
    }
  }

  int? amount;
  int? amountMedTaken;
  bool? cardioapppatientvisitsDisable;
  bool? cardioappupdatepatientvisitsDisable;
  String? cleintsId;
  CleintsIdData2? cleintsIdData;
  String? comment;
  String? createdTime;
  int? defaultNumber;
  String? doctorId;
  DoctorIdData2? doctorIdData;
  String? guid;
  String? illId;
  IllIdData2? illIdData;
  String? illName;
  String? incrementId;
  List<String>? patientVisitsIds;
  List<String>? preparatiIds;
  List<String>? preparatisName;
  List<Times2>? todayTimes;
  List<PreparatisData2>? preparatisData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }
}

class Times2 {
  Times2({
    this.count,
    this.time,
    this.afterFood,
  });

  Times2.fromJson(json) {
    count = json['count'];
    time = json['time'];
    afterFood = json['after_food'];
  }

  num? count;
  String? time;
  String? afterFood;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['time'] = time;
    map['after_food'] = afterFood;
    return map;
  }
}

class IllIdData2 {
  IllIdData2({
    this.v,
    this.id,
    this.guid,
    this.illnessName,
  });

  IllIdData2.fromJson(json) {
    v = json['__v'];
    id = json['_id'];
    guid = json['guid'];
    illnessName = json['illness_name'];
  }

  int? v;
  dynamic id;
  String? guid;
  String? illnessName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['guid'] = guid;
    map['illness_name'] = illnessName;
    return map;
  }
}

class DoctorIdData2 {
  DoctorIdData2({
    this.v,
    this.id,
    this.cardioappusertouserDisable,
    this.categoryId,
    this.desc,
    this.doctorId,
    this.doctorName,
    this.experience,
    this.guid,
    this.hospital,
    this.login,
    this.medicPhoto,
    this.password,
    this.phoneNumber,
    this.telegramNick,
  });

  DoctorIdData2.fromJson(json) {
    v = json['__v'];
    id = json['_id'];
    cardioappusertouserDisable = json['cardioapp-usertouser_disable'];
    categoryId = json['category_id'];
    desc = json['desc'];
    doctorId = json['doctor_id'];
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

  int? v;
  dynamic id;
  bool? cardioappusertouserDisable;
  String? categoryId;
  String? desc;
  String? doctorId;
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
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['cardioapp-usertouser_disable'] = cardioappusertouserDisable;
    map['category_id'] = categoryId;
    map['desc'] = desc;
    map['doctor_id'] = doctorId;
    map['doctor_name'] = doctorName;
    map['experience'] = experience;
    map['guid'] = guid;
    map['hospital'] = hospital;
    map['login'] = login;
    map['medic_photo'] = medicPhoto;
    map['password'] = password;
    map['phone_number'] = phoneNumber;
    map['telegram_nick'] = telegramNick;
    return map;
  }
}

class CleintsIdData2 {
  CleintsIdData2({
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
    this.fullName,
    this.guid,
    this.pasport,
    this.phoneNumber,
    this.userNumberId,
  });

  CleintsIdData2.fromJson(json) {
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
    fullName = json['full_name'];
    guid = json['guid'];
    pasport = json['pasport'];
    phoneNumber = json['phone_number'];
    userNumberId = json['user_number_id'];
  }

  int? v;
  dynamic id;
  String? adres;
  int? amountDoctors;
  int? amountMedicine;
  int? amountVisits;
  num? avarageDistance;
  num? avarageHeart;
  int? bestDistance;
  num? bestTime;
  String? birthDate;
  String? bloodGroup;
  bool? cardioappcreatehealthparentsDisable;
  String? cleintLang;
  String? cleintLastname;
  String? clientName;
  String? fcmToken;
  String? fullName;
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
    map['full_name'] = fullName;
    map['guid'] = guid;
    map['pasport'] = pasport;
    map['phone_number'] = phoneNumber;
    map['user_number_id'] = userNumberId;
    return map;
  }
}

class PreparatisData2 {
  PreparatisData2({
    this.amount,
    this.desc,
    this.drugPhoto,
    this.drugs,
    this.guid,
    this.naznachenieIds,
    this.todayTimes,
    this.tomorrowTimes,
  });

  PreparatisData2.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    desc = json['dosage_form'];
    drugPhoto = json['photo'];
    drugs = json['brand_name'];
    guid = json['guid'];
    naznachenieIds = json['naznachenie_ids'].cast<String>();
    if (json['today_times'] != null) {
      todayTimes = <Times2>[];
      json['today_times'].forEach((v) {
        todayTimes!.add(Times2.fromJson(v));
      });
      todayTimes?.sort((a, b) {
        final DateTime? dateA = a.time?.hhmmToDateTime;
        final DateTime? dateB = b.time?.hhmmToDateTime;
        return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
      });
    }
    if (json['tomorrow_times'] != null) {
      tomorrowTimes = <Times2>[];
      json['tomorrow_times'].forEach((v) {
        tomorrowTimes!.add(Times2.fromJson(v));
      });
      tomorrowTimes?.sort((a, b) {
        final DateTime? dateA = a.time?.hhmmToDateTime;
        final DateTime? dateB = b.time?.hhmmToDateTime;
        return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
      });
    }
  }

  String? amount;
  String? desc;
  String? drugPhoto;
  String? drugs;
  String? guid;
  List<String>? naznachenieIds;
  List<Times2>? todayTimes;
  List<Times2>? tomorrowTimes;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['dosage_form'] = desc;
    data['photo'] = drugPhoto;
    data['brand_name'] = drugs;
    data['guid'] = guid;
    data['naznachenie_ids'] = naznachenieIds;
    if (todayTimes != null) {
      data['today_times'] = todayTimes!.map((v) => v.toJson()).toList();
    }
    if (tomorrowTimes != null) {
      data['tomorrow_times'] = tomorrowTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
