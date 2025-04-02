class ProfileEditRequest {
  ProfileEditRequest({
    this.adres,
    this.bloodGroup,
    this.cleintLang,
    this.cleintLastname,
    this.clientName,
    this.fcmToken,
    this.guid,
    this.pasport,
    this.phoneNumber,
    this.userId,
    this.birthDate,
    this.telegramNick,
  });

  String? adres;
  String? bloodGroup;
  String? cleintLang;
  String? cleintLastname;
  String? clientName;
  String? fcmToken;
  String? guid;
  String? pasport;
  String? phoneNumber;
  String? userId;
  String? birthDate;
  String? telegramNick;

  Map<String, dynamic> toJson() => {
        'data': {
          'adres': adres,
          'bloods_group': (bloodGroup ?? '').isEmpty ? bloodGroup : [bloodGroup?.substring(0, bloodGroup!.length - 1)],
          'rh_factor': (bloodGroup ?? '').isEmpty ? bloodGroup : [(bloodGroup ?? '').split('').last],
          'cleint_lang': cleintLang,
          'cleint_lastname': cleintLastname,
          'client_name': clientName,
          'fcm_token': fcmToken,
          'guid': guid,
          'pasport': pasport,
          'phone_number': phoneNumber,
          'user_id': null,
          'birth_date': birthDate,
          'telegram_nick': telegramNick,
        }
      };
}
