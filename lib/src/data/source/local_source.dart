import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core/constants/app_keys.dart';
import '../../core/utils/base_functions.dart';

final class LocalSource {
  LocalSource(this.box);

  final Box<dynamic> box;

// ignore: avoid_positional_boolean_parameters
  void setHasProfile(bool hasProfile) {
    box.put(AppKeys.hasProfile, hasProfile);
  }
// ignore: avoid_positional_boolean_parameters
  Future<void> setIsForProduction(bool value) async {
    await box.put(AppKeys.isForProduction, value);
  }

  bool get isForProduction => box.get(AppKeys.isForProduction, defaultValue: false);

  Box get prefes => box;

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);

  Map<String, int> get notifications => box.get(AppKeys.notification, defaultValue: <String, int>{}) ?? <String, int>{};

  Future<void> setNotifications(Map<String, int> notifications) async {
    await box.put(AppKeys.notification, notifications);
  }

  Future<void> clearAllNotifications() async {
    await box.delete(AppKeys.notification);
  }

  Future<void> setUser({
    String? firstName,
    String? lastName,
    String? address,
    String? passportNumber,
    String? bloodGroup,
    String? dateOfBirth,
    String? accessToken,
    String? refreshToken,
    String? userId,
    String? imageUrl,
    String? phone,
    String? email,
    String? login,
    String? password,
    String? telegramNick,
    int? amountDoctor,
    int? amountVisits,
    int? amountMedicine,
    int? height,
    int? weight,
  }) async {
    await box.put(AppKeys.hasProfile, true);
    if (phone != null) await box.put(AppKeys.phone, phone);
    if (login != null) await box.put(AppKeys.login, login);
    if (email != null) await box.put(AppKeys.email, email);
    if (firstName != null) await box.put(AppKeys.firstName, firstName);
    if (lastName != null) await box.put(AppKeys.lastName, lastName);
    if (address != null) await box.put(AppKeys.address, address);
    if (passportNumber != null) {
      await box.put(AppKeys.passportNumber, passportNumber);
    }
    if (bloodGroup != null) await box.put(AppKeys.bloodGroup, bloodGroup);
    if (dateOfBirth != null) await box.put(AppKeys.dateOfBirth, dateOfBirth);
    if (accessToken != null) await box.put(AppKeys.accessToken, accessToken);
    if (refreshToken != null) await box.put(AppKeys.refreshToken, refreshToken);
    if (userId != null) await box.put(AppKeys.userId, userId);
    if (imageUrl != null) await box.put(AppKeys.imageUrl, imageUrl);
    if (password != null) await box.put(AppKeys.password, password);
    if (telegramNick != null) {
      await box.put(AppKeys.telegramUserName, telegramNick);
    }
    if (amountDoctor != null) await box.put(AppKeys.amountDoctor, amountDoctor);
    if (amountVisits != null) await box.put(AppKeys.amountVisits, amountVisits);
    if (amountMedicine != null) {
      await box.put(AppKeys.amountMedicine, amountMedicine);
    }
    if (userId != null) await box.put(AppKeys.weight, weight);
    if (userId != null) await box.put(AppKeys.height, height);
  }

  int get amountDoctor => box.get(AppKeys.amountDoctor, defaultValue: 0);

  int get amountVisits => box.get(AppKeys.amountVisits, defaultValue: 0);

  int get amountMedicine => box.get(AppKeys.amountMedicine, defaultValue: 0);

  String get accessToken => box.get(AppKeys.accessToken, defaultValue: '');

  String get firstName => box.get(AppKeys.firstName, defaultValue: '');

  String get lastName => box.get(AppKeys.lastName, defaultValue: '');

  String get address => box.get(AppKeys.address, defaultValue: '');

  String get passportNumber => box.get(AppKeys.passportNumber, defaultValue: '');

  String get bloodGroup => box.get(AppKeys.bloodGroup, defaultValue: '');

  String get dateOfBirth => box.get(AppKeys.dateOfBirth, defaultValue: '');

  String get password => box.get(AppKeys.password, defaultValue: '');

  String get userId => box.get(AppKeys.userId, defaultValue: '');

  String get phoneNumber => box.get(AppKeys.phone, defaultValue: '');

  int get surveyCount => box.get(AppKeys.surveyCount, defaultValue: 0);

  int? get height => box.get(AppKeys.height);

  int? get weight => box.get(AppKeys.weight);

  num? get temperature => box.get(AppKeys.temperature);

  String get locale => box.get(
        AppKeys.languageCode,
        defaultValue: defaultLocale,
      );

  bool get lanSelected => box.get(AppKeys.langSelected, defaultValue: false) is bool
      ? box.get(AppKeys.langSelected, defaultValue: false)
      : false;

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  Future<void> setLocale(String lang) async {
    await box.put(AppKeys.languageCode, lang);
  }

  Future<void> setSurveyCount(int surveyCount) async {
    await box.put(AppKeys.surveyCount, surveyCount);
  }

  Future<void> setPatientCardsId(String patientCardsId) async {
    await box.put(AppKeys.patientCardsId, patientCardsId);
  }

  Future<void> setKey(String key, String value) async {
    await box.put(key, value);
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setLangSelected(bool langSelected) async {
    await box.put(AppKeys.langSelected, langSelected);
  }

  Future<void> setWeight(int weight) async {
    await box.put(AppKeys.weight, weight);
  }

  Future<void> setHeight(int height) async {
    await box.put(AppKeys.height, height);
  }

  Future<void> setTemperature(num temperature) async {
    await box.put(AppKeys.temperature, temperature);
  }

  Future<void> setTelegramUserName(String telegramUserName) async {
    await box.put(AppKeys.telegramUserName, telegramUserName);
  }

  String get telegramUserName => box.get(AppKeys.telegramUserName, defaultValue: '');

  Future<void> setGoogleFitInstalledStatus({
    required bool isGoogleFitInstalled,
  }) async {
    await box.put(AppKeys.isGoogleFitInstalled, isGoogleFitInstalled);
  }

  bool get isGoogleFitInstalled => box.get(AppKeys.isGoogleFitInstalled, defaultValue: false);

  Future<void> setRegisteredFromGoogleFitStatus({
    required bool isRegisteredFromGoogleFit,
  }) async {
    await box.put(AppKeys.isRegisteredFromGoogleFit, isRegisteredFromGoogleFit);
  }

  Future<void> setGoogleFitRegistrationRemindStatus({
    required bool shouldGoogleFitRemind,
  }) async {
    await box.put(AppKeys.shouldGoogleFitRemind, shouldGoogleFitRemind);
  }

  bool get shouldGoogleFitRemind => box.get(AppKeys.shouldGoogleFitRemind, defaultValue: false);

  bool get isRegisteredFromGoogleFit => box.get(AppKeys.isRegisteredFromGoogleFit, defaultValue: false);

  Future<void> setSubscriptionStatus({required bool isSubscriptionBought}) async {
    await box.put(AppKeys.isSubscriptionBought, isSubscriptionBought);
  }

  bool get isSubscriptionBought => box.get(AppKeys.isSubscriptionBought, defaultValue: false);

  Future<void> setSubscriptionId(String setSubscriptionId) async {
    await box.put(AppKeys.subscriptionId, setSubscriptionId);
  }

  String get subscriptionId => box.get(AppKeys.subscriptionId, defaultValue: '');

  Future<void> setSubscriptionNameUz(String setSubscriptionNameUz) async {
    await box.put(AppKeys.subscriptionNameUz, setSubscriptionNameUz);
  }

  String get subscriptionNameUz => box.get(AppKeys.subscriptionNameUz, defaultValue: '');

  Future<void> setSubscriptionNameRu(String setSubscriptionNameRu) async {
    await box.put(AppKeys.subscriptionNameRu, setSubscriptionNameRu);
  }

  String get subscriptionNameRu => box.get(AppKeys.subscriptionNameRu, defaultValue: '');

  Future<void> setSubscriptionDeadline(String setSubscriptionDeadline) async {
    await box.put(AppKeys.subscriptionDeadline, setSubscriptionDeadline);
  }

  String get subscriptionDeadline => box.get(AppKeys.subscriptionDeadline, defaultValue: '');

  Future<void> deleteTelegramUserName() async {
    await box.delete(AppKeys.telegramUserName);
  }

  List<String> get getDeletedMedicineIds => box.get(AppKeys.deletedMedicineIds, defaultValue: <String>[]);

  Future<void> setDeletedMedicineIds(
    final List<String> deletedMedicineIds,
  ) async {
    await box.put(AppKeys.deletedMedicineIds, deletedMedicineIds);
  }

  Map<String, Map<String, int>> get getMedicineNotificationIds => Map<String, Map<String, int>>.from(
      box.get(AppKeys.medicineNotificationIds, defaultValue: <String, Map<String, int>>{}));

  Future<void> setMedicineNotificationIds(Map<String, Map<String, int>> medicineNotificationIds) async {
    await box.put(AppKeys.medicineNotificationIds, medicineNotificationIds);
  }

  String getKey(String key) => box.get(key, defaultValue: '');

  ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
        'system' => ThemeMode.system,
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  Future<void> clear() async {
    await box.clear();
  }

  Future<void> clearProfile() async {
    await userClear();
    await userDataClear();
  }

  Future<void> userClear() async {
    await box.delete(AppKeys.weight);
    await box.delete(AppKeys.height);
    await box.delete(AppKeys.temperature);
    await box.delete(AppKeys.hasProfile);
    await box.delete(AppKeys.phone);
    await box.delete(AppKeys.email);
    await box.delete(AppKeys.firstName);
    await box.delete(AppKeys.lastName);
    await box.delete(AppKeys.address);
    await box.delete(AppKeys.passportNumber);
    await box.delete(AppKeys.bloodGroup);
    await box.delete(AppKeys.dateOfBirth);
    await box.delete(AppKeys.password);
    await box.delete(AppKeys.accessToken);
    await box.delete(AppKeys.refreshToken);
    await box.delete(AppKeys.userId);
    await box.delete(AppKeys.imageUrl);
    await box.delete(AppKeys.patientCardsId);
    await box.delete(AppKeys.medicineNotificationIds);
    await box.delete(AppKeys.deletedMedicineIds);
    await box.delete(AppKeys.isSubscriptionBought);
    await box.delete(AppKeys.subscriptionNameUz);
    await box.delete(AppKeys.subscriptionNameRu);
    await box.delete(AppKeys.subscriptionDeadline);
    await box.delete(AppKeys.subscriptionId);
    await clearAllNotifications();
  }

  Future<void> userDataClear() async {
    await box.delete(AppKeys.surveyCount);
    await box.delete(AppKeys.amountVisits);
    await box.delete(AppKeys.favouriteDoctors);
    await box.delete(AppKeys.amountDoctor);
    await box.delete(AppKeys.amountMedicine);
    await box.delete(CacheKeys.doctorType);
  }
}
