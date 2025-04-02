part of 'package:madadio_client_mobile/src/presentation/pages/main/home/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final HomeBloc _bloc = context.read<HomeBloc>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initStateController();
  }

  void initStateController() {
    _bloc
      ..add(const GetSubscriptionStatusOfUserEvent())
      ..add(const HomeEventInitial())
      ..add(const GetFavouriteDoctorsEvent())
      ..add(const GetAppointmentsEvent())
      ..add(const GetVisitsEvent())
      ..add(const GetMedicalHistoryEvent())
      ..add(const GetAnalysisSurveyHomeEvent())
      ..add(const GetUnreadNotificationsCount())
      ..add(const GetAverageDistanceHeartEvent())
      ..add(const GetBestDistanceAndTimeEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
