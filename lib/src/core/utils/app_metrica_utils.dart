// import 'package:appmetrica_plugin/appmetrica_plugin.dart';
// import 'package:madadio_client_mobile/src/core/constants/constants.dart';

// class AppMetricaEvents {
//   // Shared
//   static const navigateTo = 'navigate_to';
//   static const openSheet = 'open_sheet';

//   // Auth
//   static const authLogin = 'auth_login';
//   static const authLogout = 'auth_logout';
//   static const authWrongLogin = 'auth_wrong_credentials';

//   // Settings
//   static const settingsChangeTheme = 'settings_change_theme';
//   static const settingsChangeLang = 'settings_change_lang';

//   // Dashboard
//   static const dashboardChangeDetailingType = 'dashboard_change_detailing_type';
//   static const dashboardChangeCalendarDate = 'dashboard_change_calendar_date';
//   static const dashboardChangeOffice = 'dashboard_change_office';

//   static const dashboardSelectStatsTab = 'dashboard_select_statistics_tab';
//   static const dashboardSelectBestsTab = 'dashboard_select_bests_tab';
//   static const dashboardSelectStore = 'dashboard_select_store';

//   // New sale
//   static const newSaleSearchProducts = 'new_sale_search_products';
//   static const newSaleRemoveFromCart = 'new_sale_remove_from_cart';
//   static const newSaleChangeQuantity = 'new_sale_change_quantity';
//   static const newSaleAddToCart = 'new_sale_add_to_cart';

//   static const newSaleApplyDiscount = 'new_sale_apply_discount';

//   static const newSaleCreateAssignClient = 'new_sale_create_assign_client';
//   static const newSaleAssignClient = 'new_sale_assign_client';
//   static const newSaleRemoveClient = 'new_sale_remove_client';
//   static const newSaleAssignCashier = 'new_sale_assign_cashier';

//   static const newSaleSelectPaymentMethod = 'new_sale_select_payment_method';
//   static const newSaleSuccessfullyClosed = 'new_sale_successfully_closed';
//   static const newSalePostpone = 'new_sale_postponed';

//   // Transactions
//   static const transactionsChangeCalendarDate =
//       'transactions_change_calendar_date';
//   static const transactionsSearchSales = 'transactions_search_sales';
//   static const transactionsSearchSalesByStore =
//       'transactions_search_sales_by_store';
//   static const transactionsOpenReturnRefund =
//       'transactions_search_sales_by_store';
// }

// class AppMetricaUtils {
//   static bool checkMetricaKeyAvailability() => Constants.yandexMetricaKey.isEmpty;

//   static Future<void> activateMetrica() async {
//     if (!checkMetricaKeyAvailability()) return;

//     return AppMetrica.activate(const AppMetricaConfig(Constants.yandexMetricaKey));
//   }

//   static void setProfileInfo({
//     required String userId,
//     required String fullName,
//     required String gender,
//     required double positionType,
//   }) {
//     if (!checkMetricaKeyAvailability()) return;
//     final UserProfileAttribute profileAttribute = UserProfileAttribute(

//     )
//     AppMetrica.setUserProfileID(userId);
//    AppMetrica.reportUserProfile(UserProfile([UserProfileAttribute()]));
//     AppmetricaSdk().reportUserProfileCustomString(key: 'gender', value: gender);
//     AppmetricaSdk().reportUserProfileCustomNumber(
//       key: 'position_type',
//       value: positionType,
//     );
//   }

//   static void sendEvent(String eventName, {Map<String, dynamic>? attributes}) {
//     if (!checkMetricaKeyAvailability()) return;

//     AppmetricaSdk().reportEvent(name: eventName, attributes: attributes);
//   }

//   static void sendNavigateToEvent(String page) {
//     if (!checkMetricaKeyAvailability()) return;

//     sendEvent(AppMetricaEvents.navigateTo, attributes: {'page_name': page});
//   }

//   static void sendOpenSheetEvent(String sheet) {
//     if (!checkMetricaKeyAvailability()) return;

//     sendEvent(AppMetricaEvents.openSheet, attributes: {'sheet_name': sheet});
//   }
// }
