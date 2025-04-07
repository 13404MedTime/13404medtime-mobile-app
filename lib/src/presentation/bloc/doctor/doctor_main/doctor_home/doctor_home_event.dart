part of 'doctor_home_bloc.dart';

sealed class DoctorHomeEvent {
  const DoctorHomeEvent();
}

final class SelectSegment$DoctorHomeEvent extends DoctorHomeEvent {
  const SelectSegment$DoctorHomeEvent({required this.index});

  final Set<int> index;
}

final class GetPatients$DoctorHomeEvent extends DoctorHomeEvent {
  const GetPatients$DoctorHomeEvent();
}

final class DeleteDoctorFreeTime$DoctorHomeEvent extends DoctorHomeEvent {
  const DeleteDoctorFreeTime$DoctorHomeEvent({required this.timeId});

  final String timeId;
}

final class GetDoctorBookingRequests$DoctorHomeEvent extends DoctorHomeEvent {
  const GetDoctorBookingRequests$DoctorHomeEvent();
}

final class RejectDoctorBookingRequest$DoctorHomeEvent extends DoctorHomeEvent {
  const RejectDoctorBookingRequest$DoctorHomeEvent(
      {required this.requestId, required this.rejectComment});

  final String requestId;
  final String rejectComment;
}

final class AcceptDoctorBookingRequest$DoctorHomeEvent extends DoctorHomeEvent {
  const AcceptDoctorBookingRequest$DoctorHomeEvent({required this.booking});

  final BookingResponse booking;
}

final class AddTimeLoading$DoctorHomeEvent extends DoctorHomeEvent {
  const AddTimeLoading$DoctorHomeEvent();
}
