part of 'my_visit_bloc.dart';

@freezed
class MyVisitEvent with _$MyVisitEvent {
  const factory MyVisitEvent.started() = _Started;

  const factory MyVisitEvent.getVisit({required String guid}) = GetVisitEvent;

  const factory MyVisitEvent.checkConsultationDays() = CheckConsultationDaysEvent;

  const factory MyVisitEvent.getDoctorFreeTime({required String guid}) = GetDoctorFreeTimeEvent;
  const factory MyVisitEvent.getSelectedDate({required DateTime selectedDate}) = GetSelectedDateEvent;
  const factory MyVisitEvent.selectFreeTime({required DoctorBooking freeTime}) = SelectFreeTime;
  const factory MyVisitEvent.bookDoctor({
    required String doctorBookingGuid,
    required String comment,
    required String doctorGuid,
    required BuildContext context,
  }) = BookDoctorEvent;

  const factory MyVisitEvent.getDoctorBookingRequests() = GetDoctorBookingRequestsEvent;
}
