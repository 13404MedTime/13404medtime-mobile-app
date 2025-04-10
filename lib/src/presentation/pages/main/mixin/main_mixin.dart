part of '../main_page.dart';

mixin MainMixin on State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<HealthBloc>()
      ..add(const GetStepsCountOfTodayEvent())
      ..add(const GetArterialPressureEvent())
      ..add(const GetBloodSugarEvent())
      ..add(const GetTWHEvent())
      ..add(const GetPedometerEvent());
  }

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
