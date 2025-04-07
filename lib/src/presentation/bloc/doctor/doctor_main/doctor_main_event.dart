part of 'doctor_main_bloc.dart';

sealed class DoctorMainEvent {
  const DoctorMainEvent();
}

final class ChangePage$DoctorMainEvent extends DoctorMainEvent {
  const ChangePage$DoctorMainEvent(this.index);

  final int index;
}
