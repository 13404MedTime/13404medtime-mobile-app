part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';
  static const String main = '/main';
  static const String onUnknownRoute = '/onUnknownRoute';
  static const String langSelect = '/lang_select';
  static const String internetConnection = '/internetConnection';
  static const String doctorMain = '/doctorMain';
  static const String auth = '/auth';
  static const String myAppointments = '/myAppointments';
}
