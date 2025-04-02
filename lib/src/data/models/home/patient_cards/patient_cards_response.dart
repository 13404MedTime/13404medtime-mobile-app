class GetUserDataResponse {
  GetUserDataResponse({
    this.address,
    this.avarageDistance,
    this.avarageHeart,
    this.bestDistance,
    this.bestTime,
    this.birthDate,
    this.bloodGroup,
    this.clientLang,
    this.clientLastName,
    this.clientName,
    this.fcmToken,
    this.guid,
    this.pasport,
    this.telegramNick,
    this.phoneNumber,
    this.userNumberId,
    this.amountDoctor,
    this.amountMedicine,
    this.amountVisits,
  });

  GetUserDataResponse.fromJson(Map json) {
    if (json['data']['data']['response'] is List && (json['data']['data']['response'] as List).isNotEmpty) {
      json = json['data']['data']['response'][0];
    } else {
      return;
    }
    address = json['adres'];
    avarageDistance = json['avarage_distance'];
    avarageHeart = json['avarage_heart'];
    bestDistance = json['best_distance'];
    bestTime = json['best_time'];
    birthDate = json['birth_date'];
    final bloodgroup = json['bloods_group'];
    final rhfactor = json['rh_factor'];
    if (bloodgroup is List && bloodgroup.isNotEmpty && rhfactor is List && rhfactor.isNotEmpty) {
      bloodGroup = '${bloodgroup[0]}${rhfactor[0]}';
    }
    clientLang = json['cleint_lang'];
    clientLastName = json['cleint_lastname'];
    clientName = json['client_name'];
    fcmToken = json['fcm_token'];
    guid = json['guid'];
    pasport = json['pasport'];
    phoneNumber = json['phone_number'];
    userNumberId = json['user_number_id'];
    amountDoctor = json['amount_doctors'];
    amountMedicine = int.tryParse(json['amount_medicine'].toString());
    amountVisits = json['amount_visits'];
    telegramNick = json['telegram_nick'];
  }

  String? address;
  num? avarageDistance;
  num? avarageHeart;
  num? bestDistance;
  num? bestTime;
  String? birthDate;
  String? bloodGroup;
  String? clientLang;
  String? clientLastName;
  String? clientName;
  String? fcmToken;
  String? guid;
  String? pasport;
  String? telegramNick;
  String? phoneNumber;
  String? userNumberId;
  int? amountDoctor;
  int? amountVisits;
  int? amountMedicine;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetUserDataResponse &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          avarageDistance == other.avarageDistance &&
          avarageHeart == other.avarageHeart &&
          bestDistance == other.bestDistance &&
          bestTime == other.bestTime &&
          birthDate == other.birthDate &&
          bloodGroup == other.bloodGroup &&
          clientLang == other.clientLang &&
          clientLastName == other.clientLastName &&
          clientName == other.clientName &&
          fcmToken == other.fcmToken &&
          guid == other.guid &&
          pasport == other.pasport &&
          telegramNick == other.telegramNick &&
          phoneNumber == other.phoneNumber &&
          userNumberId == other.userNumberId;

  @override
  int get hashCode =>
      address.hashCode ^
      avarageDistance.hashCode ^
      avarageHeart.hashCode ^
      bestDistance.hashCode ^
      bestTime.hashCode ^
      birthDate.hashCode ^
      bloodGroup.hashCode ^
      clientLang.hashCode ^
      clientLastName.hashCode ^
      clientName.hashCode ^
      fcmToken.hashCode ^
      guid.hashCode ^
      pasport.hashCode ^
      telegramNick.hashCode ^
      phoneNumber.hashCode ^
      userNumberId.hashCode;
}
