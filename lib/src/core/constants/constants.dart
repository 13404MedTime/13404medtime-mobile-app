sealed class Constants {
  Constants._();

  static const String baseUrl = 'https://api.admin.u-code.io/';
  static const String authUrl = 'https://api.auth.u-code.io/';
  static const String uploadUrl = 'https://api.admin.u-code.io/v1/';
  static const String cdnImage = 'https://cdn.u-code.io/ucode/';
  static const String cdnDocs = 'https://cdn.u-code.io/docs/';
  static const String projectId = 'a4dc1f1c-d20f-4c1a-abf5-b819076604bc';
  static const String environmentId = 'dcd76a3d-c71b-4998-9e5c-ab1e783264d0';
  static const String resourceId = 'a97e8954-5d8e-4469-a241-9a9af2ea2978';
  static const String apiKey = 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS';
  static const String yandexMetricaKey = '3bd8bd17-215a-4999-9216-45fe5df58e0b';

  /// test
  static const clientTypeId = '24fd6d7e-c0e7-4029-88cc-2595e9c643d5';
  static const companyId = '696c77b5-0ebd-4277-a278-a7343421a32a';
  static const expiresAt = '2025-06-23T06:00:10.049Z';
  static const roleId = '425486de-89dc-48a7-9fa8-47f7b4eeffcb';
}

sealed class FirebaseAnalyticsEvents {
  FirebaseAnalyticsEvents._();
  // Регистрация клиента
  static const String registerUser = 'register_user';
  // Вход клиента в аккаунт приложения
  static const String signInAccount = 'sign_in_account';
  // Поиск категории
  static const String searchCategory = 'search_category';
  // Поиск врачей
  static const String searchDoctors = 'search_doctors';
  // Кнопка «Написать в телеграм»
  static const String writeOnTelegramBtn = 'write_on_telegram_btn';
  // Кнопка «Обратиться к врачу» на Главной странице
  static const String consultADoctorBtnMainView = 'consult_a_doctor_btn_main_view';
  // Кнопка «Выйти из аккаунта»
  static const String logOutBtn = 'log_out_btn';
  // Кнопка «Удалить аккаунт»
  static const String deleteAccountBtn = 'delete_account_btn';
  // Кнопка «Смотреть назначения» на Главной странице
  static const String viewAppointmentsMainViewBtn = 'view_appointments_main_view_btn';
  // Кнопка «Колокольчик» на Главной странице
  static const String notificationBellMainViewBtn = 'notification_bell_main_view_btn';
  // Кнопка «Обследование» на Главной странице
  static const String surveyMainViewBtn = 'survey_main_view_btn';
  // Кнопка «Связаться с нами» в разделе Профиль-Настройки
  static const String contactUsBtn = 'contact_us_btn';
  // Кнопка «Позвонить» в разделе Профиль-Настройки
  static const String callBtn = 'call_btn';
  // Кнопка «Инстраграм» в разделе Профиль-Настройки
  static const String instagramBtn = 'instagram_btn';
  // Кнопка «Телеграм» в разделе Профиль-Настройки
  static const String telegramBtn = 'telegram_btn';
  // Кнопка «О приложении» в разделе Профиль-Настройки
  static const String aboutTheAppBtn = 'about_the_app_btn';
  // Кнопка «История болезней» в разделе Профиль
  static const String onProfileMedicalHistoryBtn = 'on_profile_medical_history_btn';
  // Кнопка «Главная»
  static const String mainViewNavigationBtn = 'main_view_navigation_btn';
  // Кнопка «Консультация»
  static const String consultationNavigationBtn = 'consultation_view_navigation_btn';
  // Кнопка «Здоровье»
  static const String healthNavigationBtn = 'health_view_navigation_btn';
  // Кнопка «Профиль»s
  static const String profileNavigationBtn = 'profile_view_navigation_btn';
  // Кнопка «Добавить шагомер»
  static const String addAPedometerBtn = 'add_a_pedometer_btn';
  // Кнопка «Добавить артериальное давление»
  static const String addBloodPressure = 'add_blood_pressure';
  // Кнопка «Добавить сахар крови»
  static const String addBloodSugarBtn = 'add_blood_sugar_btn';
  //Добавить температуру, вес, рост
  static const String addTWHBtn = 'add_TWH_btn';
}

// height of the 'Gallery' header
const double galleryHeaderHeight = 64;

// The font size delta for headline4 font.
const double desktopDisplay1FontDelta = 16;

// The width of the settingsDesktop.
const double desktopSettingsWidth = 520;

// Sentinel value for the system text scale factor option.
const double systemTextScaleFactorOption = -1;

// The splash page animation duration.
const splashPageAnimationDurationInMilliseconds = 300;

// The desktop top padding for a page's first header (e.g. Gallery, Settings)
const firstHeaderDesktopTopPadding = 5.0;

const Duration animationDuration = Duration(milliseconds: 250);

const int birthNotifKey = 1234567890;

const List<String> bloodGroups = [
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  'O+',
  'O-',
];
