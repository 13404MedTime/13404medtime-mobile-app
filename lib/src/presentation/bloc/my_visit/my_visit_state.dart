part of 'my_visit_bloc.dart';

@freezed
class MyVisitState with _$MyVisitState {
  const factory MyVisitState({
    @Default(null) MyVisitModel? visitData,
    @Default('') String? subscriptionName,
    @Default(null) int? consultationDays,
    @Default(false) bool isExistConsultationDays,
    @Default(false) bool isLoading,
    @Default([]) List<DoctorBooking> bookings,
    @Default([]) List<DoctorBooking> selectedBookings,
    @Default(null) DoctorBooking? selected,
    @Default([]) List<BookingResponse> bookingRequests,
  }) = _MyVisitState;
}
