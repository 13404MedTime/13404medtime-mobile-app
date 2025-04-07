import '../consultation/doctors_types_response.dart';
import '../purpose/medication_response.dart';

class MyAppointmentsResponse {
  MyAppointmentsResponse({
    this.count,
    this.myAppointments,
  });

  MyAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    count = json['data']['data']['count'];
    if (json['data']['data']['response'] != null) {
      myAppointments = <MyAppointModel>[];
      json['data']['data']['response'].forEach((v) {
        myAppointments?.add(MyAppointModel.fromJson(v));
      });
    }
  }

  int? count;
  List<MyAppointModel>? myAppointments;
}

class MyAppointModel {
  MyAppointModel({
    this.beforeAfterFood,
    this.defaultNumber,
    this.count,
    this.isTake,
    this.medicineTakingIdData,
    this.timeTake,
    this.clientsId,
    this.clientsIdData,
    this.guid,
    this.medicineTime,
    this.naznachenieId,
    this.naznachenieIdData,
    this.preparatiId,
    this.preparatiIdData,
  });

  MyAppointModel.fromJson(Map<String, dynamic> json) {
    beforeAfterFood = json['before_after_food'];
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    defaultNumber = json['default_number'];
    count = json['count'];
    guid = json['guid'];
    isTake = json['is_take'];
    medicineTakingId = json['medicine_taking_id'];
    medicineTakingIdData =
        json['medicine_taking_id_data'] != null ? MedicineTakingIdData.fromJson(json['medicine_taking_id_data']) : null;
    medicineTime = json['medicine_time'];
    naznachenieId = json['naznachenie_id'];
    naznachenieIdData =
        json['naznachenie_id_data'] != null ? NaznachenieIdData.fromJson(json['naznachenie_id_data']) : null;
    preparatName = json['preparat_name'];
    preparatiId = json['preparati_id'];
    preparatiIdData = json['preparati_id_data'] != null ? PreparatiIdData.fromJson(json['preparati_id_data']) : null;
    timeTake = json['time_take'];
    isFromPatient = json['is_from_patient'];
  }

  String? beforeAfterFood;
  int? defaultNumber;
  num? count;
  bool? isTake;
  bool? isFromPatient;
  String? medicineTakingId;
  MedicineTakingIdData? medicineTakingIdData;
  String? timeTake;
  String? clientsId;
  ClientIdData? clientsIdData;
  String? guid;
  String? medicineName;
  String? medicineTime;
  String? naznachenieId;
  NaznachenieIdData? naznachenieIdData;
  String? preparatiId;
  PreparatiIdData? preparatiIdData;
  String? preparatName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAppointModel &&
          runtimeType == other.runtimeType &&
          beforeAfterFood == other.beforeAfterFood &&
          defaultNumber == other.defaultNumber &&
          count == other.count &&
          isTake == other.isTake &&
          isFromPatient == other.isFromPatient &&
          medicineTakingId == other.medicineTakingId &&
          medicineTakingIdData == other.medicineTakingIdData &&
          timeTake == other.timeTake &&
          clientsId == other.clientsId &&
          clientsIdData == other.clientsIdData &&
          guid == other.guid &&
          medicineName == other.medicineName &&
          medicineTime == other.medicineTime &&
          naznachenieId == other.naznachenieId &&
          naznachenieIdData == other.naznachenieIdData &&
          preparatiId == other.preparatiId &&
          preparatiIdData == other.preparatiIdData &&
          preparatName == other.preparatName;

  @override
  int get hashCode =>
      beforeAfterFood.hashCode ^
      defaultNumber.hashCode ^
      count.hashCode ^
      isTake.hashCode ^
      isFromPatient.hashCode ^
      medicineTakingId.hashCode ^
      medicineTakingIdData.hashCode ^
      timeTake.hashCode ^
      clientsId.hashCode ^
      clientsIdData.hashCode ^
      guid.hashCode ^
      medicineName.hashCode ^
      medicineTime.hashCode ^
      naznachenieId.hashCode ^
      naznachenieIdData.hashCode ^
      preparatiId.hashCode ^
      preparatiIdData.hashCode ^
      preparatName.hashCode;
}

class NaznachenieIdData {
  NaznachenieIdData({
    this.amount,
    this.amountMedTaken,
    this.clientId,
    this.clientsIdData,
    this.comment,
    this.createdTime,
    this.doctorId,
    this.doctorIdData,
    this.guid,
    this.illId,
    this.illIdData,
    this.illName,
    this.preparatiIds,
  });

  NaznachenieIdData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] is int ? json['amount'] : 0;
    amountMedTaken = json['amount_med_taken'] is int ? json['amount_med_taken'] : 0;
    clientId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    comment = json['comment'];
    createdTime = json['created_time'];
    doctorId = json['doctor_id'];
    doctorIdData = json['doctor_id_data'] != null ? DoctorIdData.fromJson(json['doctor_id_data']) : null;
    guid = json['guid'];
    illId = json['ill_id'];
    illIdData = json['ill_id_data'] != null ? IllIdData.fromJson(json['ill_id_data']) : null;
    illName = json['ill_name'];
    preparatiIds = json['preparati_ids'] is List<String> ? (json['preparati_ids'] as List<String>) : null;
  }

  int? amount;
  int? amountMedTaken;
  String? clientId;
  ClientIdData? clientsIdData;
  String? comment;
  String? createdTime;
  String? doctorId;
  DoctorIdData? doctorIdData;
  String? guid;
  String? illId;
  IllIdData? illIdData;
  String? illName;
  List<String>? preparatiIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NaznachenieIdData &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          amountMedTaken == other.amountMedTaken &&
          clientId == other.clientId &&
          clientsIdData == other.clientsIdData &&
          comment == other.comment &&
          createdTime == other.createdTime &&
          doctorId == other.doctorId &&
          doctorIdData == other.doctorIdData &&
          guid == other.guid &&
          illId == other.illId &&
          illIdData == other.illIdData &&
          illName == other.illName &&
          preparatiIds == other.preparatiIds;

  @override
  int get hashCode =>
      amount.hashCode ^
      amountMedTaken.hashCode ^
      clientId.hashCode ^
      clientsIdData.hashCode ^
      comment.hashCode ^
      createdTime.hashCode ^
      doctorId.hashCode ^
      doctorIdData.hashCode ^
      guid.hashCode ^
      illId.hashCode ^
      illIdData.hashCode ^
      illName.hashCode ^
      preparatiIds.hashCode;
}

class ClientIdData {
  ClientIdData({
    this.address,
    this.bloodGroup,
    this.clientLang,
    this.clientLastname,
    this.clientName,
    this.fcmToken,
    this.guid,
    this.login,
    this.pasport,
    this.password,
    this.phoneNumber,
    this.userId,
  });

  ClientIdData.fromJson(Map<String, dynamic> json) {
    address = json['adres'];
    bloodGroup = json['blood_group'];
    clientLang = json['cleint_lang'];
    clientLastname = json['cleint_lastname'];
    clientName = json['client_name'];
    fcmToken = json['fcm_token'];
    guid = json['guid'];
    login = json['login'];
    pasport = json['pasport'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    userId = json['user_id'];
  }

  String? address;
  String? bloodGroup;
  String? clientLang;
  String? clientLastname;
  String? clientName;
  String? fcmToken;
  String? guid;
  String? login;
  String? pasport;
  String? password;
  String? phoneNumber;
  String? userId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClientIdData &&
        other.address == address &&
        other.bloodGroup == bloodGroup &&
        other.clientLang == clientLang &&
        other.clientLastname == clientLastname &&
        other.clientName == clientName &&
        other.fcmToken == fcmToken &&
        other.guid == guid &&
        other.login == login &&
        other.pasport == pasport &&
        other.password == password &&
        other.phoneNumber == phoneNumber &&
        other.userId == userId;
  }

  @override
  int get hashCode =>
      address.hashCode ^
      bloodGroup.hashCode ^
      clientLang.hashCode ^
      clientLastname.hashCode ^
      clientName.hashCode ^
      fcmToken.hashCode ^
      guid.hashCode ^
      login.hashCode ^
      pasport.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      userId.hashCode;
}

class DoctorIdData {
  DoctorIdData({
    this.categoryId,
    this.categoryId2,
    this.categoryIdData,
    this.desc,
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

  DoctorIdData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryId2 = json['category_id_2'];
    categoryIdData = json['category_id_data'] != null ? DoctorTypeModel.fromJson(json['category_id_data']) : null;
    desc = json['desc'];
    descUz = json['desc_uz'];
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

  String? categoryId;
  String? categoryId2;
  DoctorTypeModel? categoryIdData;
  String? desc;
  String? descUz;
  String? doctorName;
  int? experience;
  String? guid;
  String? hospital;
  String? login;
  String? medicPhoto;
  String? password;
  String? phoneNumber;
  String? telegramNick;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoctorIdData &&
        other.categoryId == categoryId &&
        other.categoryId2 == categoryId2 &&
        other.categoryIdData == categoryIdData &&
        other.desc == desc &&
        other.doctorName == doctorName &&
        other.experience == experience &&
        other.guid == guid &&
        other.hospital == hospital &&
        other.login == login &&
        other.medicPhoto == medicPhoto &&
        other.password == password &&
        other.phoneNumber == phoneNumber &&
        other.telegramNick == telegramNick;
  }

  @override
  int get hashCode =>
      categoryId.hashCode ^
      categoryId2.hashCode ^
      categoryIdData.hashCode ^
      desc.hashCode ^
      doctorName.hashCode ^
      experience.hashCode ^
      guid.hashCode ^
      hospital.hashCode ^
      login.hashCode ^
      medicPhoto.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      telegramNick.hashCode;
}

class IllIdData {
  IllIdData({
    this.guid,
    this.illnessName,
  });

  IllIdData.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    illnessName = json['illness_name'];
  }

  String? guid;
  String? illnessName;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IllIdData && other.guid == guid && other.illnessName == illnessName;
  }

  @override
  int get hashCode => guid.hashCode ^ illnessName.hashCode;
}

class PreparatiIdData {
  PreparatiIdData({
    this.amount,
    this.desc,
    this.drugPhoto,
    this.drugs,
    this.guid,
    this.brandName,
    this.dosageForm,
    this.naznachenieIds,
  });

  PreparatiIdData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    desc = json['desc'];
    drugPhoto = json['photo'];
    drugs = json['brand_name'];
    guid = json['guid'];
    brandName = json['brand_name'];
    dosageForm = json['dosage_form'];
    medicineName = json['medicine_name'];
    naznachenieIds = json['naznachenie_ids'] is List
        ? List.generate((json['naznachenie_ids'] as List).length,
            (index) => (json['naznachenie_ids'] as List)[index]?.toString() ?? '')
        : null;
  }

  String? amount;
  String? desc;
  String? drugPhoto;
  String? drugs;
  String? guid;
  String? brandName;
  String? medicineName;
  String? dosageForm;
  List<String>? naznachenieIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreparatiIdData &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          desc == other.desc &&
          drugPhoto == other.drugPhoto &&
          drugs == other.drugs &&
          guid == other.guid &&
          brandName == other.brandName &&
          dosageForm == other.dosageForm &&
          naznachenieIds == other.naznachenieIds;

  @override
  int get hashCode =>
      amount.hashCode ^
      desc.hashCode ^
      drugPhoto.hashCode ^
      drugs.hashCode ^
      guid.hashCode ^
      brandName.hashCode ^
      dosageForm.hashCode ^
      naznachenieIds.hashCode;
}
