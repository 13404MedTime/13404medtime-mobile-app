sealed class AppKeys {
  AppKeys._();

  static const String ru = 'ru';
  static const String uz = 'uz';
  static const String en = 'en';
  static const String currentTransactionKey = 'current_transaction';
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String languageCode = 'language_code';
  static const String themeMode = 'theme_mode';
  static const String favouriteDoctors = 'favourite_doctors';
  static const String patientCardsId = 'patient_cards_id';
  static const String userId = 'user_id';
  static const String imageUrl = 'image_url';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String address = 'address';
  static const String passportNumber = 'passport_number';
  static const String dateOfBirth = 'date_of_birth';
  static const String bloodGroup = 'blood_group';
  static const String password = 'password';
  static const String hasProfile = 'hasProfile';
  static const String isForProduction = 'is_for_production';
  static const String phone = 'phone';
  static const String login = 'login';
  static const String email = 'email';
  static const String langSelected = 'lang_selected';
  static const String amountDoctor = 'amount_doctor';
  static const String amountVisits = 'amount_visits';
  static const String amountMedicine = 'amount_medicine';
  static const String surveyCount = 'survey_count';
  static const String pedometer = 'pedometer';
  static const String notification = 'notification';
  static const String height = 'height';
  static const String weight = 'weight';
  static const String temperature = 'temperature';
  static const String setFirstLang = 'setFirstLang';
  static const String telegramUserName = 'telegramUserName';
  static const String medicineNotificationIds = 'medicine_notification_ids';
  static const String deletedMedicineIds = 'deleted_medicine_ids';
  static const String isSubscriptionBought = 'is_subscription_bought';
  static const String subscriptionId = 'subscription_id';
  static const String subscriptionNameUz = 'subscription_name_uz';
  static const String subscriptionNameRu = 'subscription_name_ru';
  static const String subscriptionDeadline = 'subscription_deadline';
  static const String hasAccessAppleHealth = 'has_access_apple_health';
  static const String isGoogleFitInstalled = 'is_google_fit_installed';
  static const String shouldGoogleFitRemind = 'should_google_fit_remind';
  static const String isRegisteredFromGoogleFit = 'is_registered_from_google_fit';
}

sealed class CacheKeys {
  CacheKeys._();

  static const String doctorType = 'doctor_types';
}
