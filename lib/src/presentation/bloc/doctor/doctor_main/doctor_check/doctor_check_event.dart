part of 'doctor_check_bloc.dart';

sealed class DoctorCheckEvent {
  const DoctorCheckEvent();
}

final class GetDoctorAppointments$DoctorCheckEvent extends DoctorCheckEvent {
  const GetDoctorAppointments$DoctorCheckEvent();
}
