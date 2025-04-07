part of 'my_appointments_bloc.dart';

@freezed
class MyAppointmentsEvent with _$MyAppointmentsEvent {
  const factory MyAppointmentsEvent.getAppointments() = GetAppointmentsEvent;
  const factory MyAppointmentsEvent.updateDrugStatus({
    required Function onSuccess,
    required bool value,
    required int index,
    required BuildContext context,
  }) = UpdateDrugStatus;
  const factory MyAppointmentsEvent.getInitialData({
    required SwitchModel switchData,
  }) = GetInitialData;
}
