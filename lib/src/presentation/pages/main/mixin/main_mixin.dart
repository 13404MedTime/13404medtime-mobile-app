part of 'package:madadio_client_mobile/src/presentation/pages/main/main_page.dart';

mixin MainMixin on State<MainPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localNotification();
  }

  Future<void> localNotification() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (!mounted) return;
    if ((notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) &&
        !context.read<MainBloc>().state.appStarted) {
      await Navigator.pushNamed(
        context,
        Routes.myAppointments,
        arguments: 'notification',
      );
    }
  }
}
