part of 'doctor_advice_bloc.dart';

sealed class DoctorAdviceEvent {
  const DoctorAdviceEvent();
}

final class GetClients$DoctorAdviceEvent extends DoctorAdviceEvent {
  const GetClients$DoctorAdviceEvent(this.phone);

  final String phone;
}

final class GetMedicine$DoctorAdviceEvent extends DoctorAdviceEvent {
  const GetMedicine$DoctorAdviceEvent(this.name);

  final String name;
}

final class SelectClient$DoctorAdviceEvent extends DoctorAdviceEvent {
  const SelectClient$DoctorAdviceEvent(this.client);

  final Client client;
}

final class SelectMedicine$DoctorAdviceEvent extends DoctorAdviceEvent {
  const SelectMedicine$DoctorAdviceEvent(this.medicine);

  final MedicineResponse medicine;
}

final class SendAdvice$DoctorAdviceEvent extends DoctorAdviceEvent {
  const SendAdvice$DoctorAdviceEvent();
}

final class SelectPage$DoctorAdviceEvent extends DoctorAdviceEvent {
  const SelectPage$DoctorAdviceEvent(this.page);

  final int page;
}

final class AddMedicine$DoctorAdviceEvent extends DoctorAdviceEvent {
  const AddMedicine$DoctorAdviceEvent(this.medicine);

  final MedicineInformation medicine;
}

final class RemoveMedicine$DoctorAdviceEvent extends DoctorAdviceEvent {
  const RemoveMedicine$DoctorAdviceEvent(this.id);

  final int id;
}

final class SendFullAdvice$DoctorAdviceEvent extends DoctorAdviceEvent {
  const SendFullAdvice$DoctorAdviceEvent();
}

final class GetAllMedicines$DoctorAdviceEvent extends DoctorAdviceEvent {
  const GetAllMedicines$DoctorAdviceEvent(this.name);

  final String name;
}
