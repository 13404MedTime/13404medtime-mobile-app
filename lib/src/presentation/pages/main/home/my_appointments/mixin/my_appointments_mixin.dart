part of 'package:madadio_client_mobile/src/presentation/pages/main/home/my_appointments/my_appointments_page.dart';

mixin MyAppointmentsMixin on State<MyAppointmentsPage> {
  late final MyAppointmentsBloc _bloc = context.read<MyAppointmentsBloc>();
  int appointmentCount = 0;

  @override
  void initState() {
    super.initState();
    _getInitialData();
  }

  void _getInitialData() {
    final data = widget.switchData;
    if (data.today.isEmpty && data.tomorrow.isEmpty) {
      _bloc.add(const MyAppointmentsEvent.getAppointments());
    } else {
      _bloc.add(MyAppointmentsEvent.getInitialData(switchData: data));
    }
  }
}
