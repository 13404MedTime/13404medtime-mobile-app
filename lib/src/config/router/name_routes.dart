part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';
  static const String main = '/main';
  static const String home = '/main';
  static const String internetConnection = '/internet_connection';
  static const String settings = '/settings';
  static const String auth = '/auth';
  static const String confirmCode = '/confirm_code';
  static const String register = '/register';
  static const String langSelect = '/lang_select';
  static const String editProfile = '/edit_profile';
  static const String selectedDoctors = '/selected_doctors';
  static const String diseaseHistory = '/disease_history';
  static const String myAppointments = '/my_appointments';
  static const String myVisit = '/my_visit';
  static const String subscription = '/subscription';
  static const String paymentMethods = '/payment_methods';
  static const String purposePage = '/purpose_page';
  static const String subPurposePage = '/sub_purpose_page';
  static const String medicalHistory = '/medical_history';
  static const String specialists = '/specialists';
  static const String survey = '/survey';
  static const String photoView = '/photo_view';
  static const String subHealth = '/sub_health';
  static const String showAllMyVisits = '/show_all_my_visits';
  static const String notifications = '/notifications';
  static const String addMedicine = '/add_medicine';
  static const String medicationDescription = '/medication_escription';
  static const String medicationFiles = '/medication_files';
  static const String login = '/login';
  static const String doctorMain = '/doctorMain';
  static const String addFreeTime = '/addFreeTime';
  static const String clientProfile = '/client_profile';
  static const String doctorRequests = '/doctor_requests';
  static const String upcomingVisits = '/upcoming_visits';
  static const String viewRejectedRequest = '/view_rejected_request';
}
