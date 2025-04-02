part of 'package:madadio_client_mobile/src/presentation/pages/main/profile/notification/notification_page.dart';

mixin NotificationMixin on State<NotificationPage> {
  // late final HomeBloc _homeBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // _homeBloc = widget.bloc;
    _scrollController = ScrollController();
    // _updateHomeUnreadNotificationsCount();
    _getNotification();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // _updateHomeUnreadNotificationsCount();
    super.dispose();
  }

  @override
  void deactivate() {
    _updateHomeUnreadNotificationsCount();
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        context.read<NotificationBloc>().add(const NotificationEvent.paginationNotifications());
      }
    });
  }

  void _updateHomeUnreadNotificationsCount() {
    widget.bloc.add(
      const HomeEvent.getUnreadNotificationsCount(),
    );
  }

  void _getNotification() {
    context.read<NotificationBloc>().add(
      NotificationEvent.getNotifications(
        onSuccess: () {
          debugPrint('ishladiiiiii');
        },
      ),
    );
  }
}
