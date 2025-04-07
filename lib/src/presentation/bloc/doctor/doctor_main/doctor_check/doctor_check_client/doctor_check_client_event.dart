part of 'doctor_check_client_bloc.dart';

sealed class DoctorCheckClientEvent {
  const DoctorCheckClientEvent();
}

final class GetMedicineInfo$DoctorCheckClientEvent extends DoctorCheckClientEvent {
  const GetMedicineInfo$DoctorCheckClientEvent({
    required this.guid,
    required this.endDate,
    required this.startDate,
  });

  final String guid;
  final String startDate;
  final String endDate;
}
