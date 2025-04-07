part of 'my_appointments_bloc.dart';

class MyAppointmentsState extends Equatable {
  const MyAppointmentsState({
    this.myAppointments = const [],
    this.switchData = const SwitchModel(),
    this.status = AppointmentStatus.initial,
    this.isMedicineLoading = false,
    this.changedItemIndex,
  });

  MyAppointmentsState copyWith({
    final List<MyAppointModel>? myAppointments,
    final SwitchModel? switchData,
    final AppointmentStatus? status,
    final bool? isMedicineLoading,
    final ValueGetter<int?>? changedItemIndex,
  }) =>
      MyAppointmentsState(
        myAppointments: myAppointments ?? this.myAppointments,
        switchData: switchData ?? this.switchData,
        status: status ?? this.status,
        isMedicineLoading: isMedicineLoading ?? this.isMedicineLoading,
        changedItemIndex: changedItemIndex != null ? changedItemIndex() : this.changedItemIndex,
      );

  final List<MyAppointModel> myAppointments;
  final SwitchModel switchData;
  final AppointmentStatus status;
  final bool isMedicineLoading;
  final int? changedItemIndex;

  @override
  List<Object?> get props => [
        myAppointments,
        switchData,
        status,
        isMedicineLoading,
        changedItemIndex,
      ];
}
