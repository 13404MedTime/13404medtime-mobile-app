import '../../config/router/app_routes.dart';

mixin CacheMixin {
  Future<void> setUserInfo({
    String? printId,
    String? firstName,
    String? lastName,
    String? address,
    String? passportNumber,
    String? bloodGroup,
    String? dateOfBirht,
    String? id,
    String? login,
    String? email,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
    String? imageUrl,
    String? password,
    String? telegramNick,
    int? amountDoctor,
    int? amountVisits,
    int? amountMedicine,
    int? weight,
    int? height,
  }) async {
    // print('dkd: $printId | $dateOfBirht');
    // print('dkd: $printId | $amountMedicine');
    await localSource.setUser(
      firstName: firstName,
      lastName: lastName,
      address: address,
      passportNumber: passportNumber?.toUpperCase(),
      bloodGroup: bloodGroup,
      dateOfBirth: dateOfBirht,
      userId: id,
      login: login,
      email: email,
      phone: phoneNumber,
      accessToken: accessToken,
      refreshToken: refreshToken,
      imageUrl: imageUrl,
      password: password,
      telegramNick: telegramNick,
      amountDoctor: amountDoctor,
      amountVisits: amountVisits,
      amountMedicine: amountMedicine,
      weight: weight,
      height: height,
    );
  }
}
