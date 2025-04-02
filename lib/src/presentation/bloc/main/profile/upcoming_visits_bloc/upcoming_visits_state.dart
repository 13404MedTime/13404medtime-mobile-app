part of 'upcoming_visits_bloc.dart';

class UpcomingVisitsState extends Equatable {
  const UpcomingVisitsState({
    this.isLoading = false,
    this.bookings = const {},
    this.doctorBookings = const {},
    this.selected = const {0},
  });

  final bool isLoading;
  final Set<int> selected;
  final Map<String, List<BookingResponse>> bookings;
  final Map<String, List<DoctorBooking>> doctorBookings;

  @override
  List<Object?> get props => [
        isLoading,
        bookings,
        doctorBookings,
        selected,
      ];

  UpcomingVisitsState copyWith({
    bool? isLoading,
    Map<String, List<BookingResponse>>? bookings,
    Map<String, List<DoctorBooking>>? doctorBookings,
    Set<int>? selected,
  }) =>
      UpcomingVisitsState(
        isLoading: isLoading ?? this.isLoading,
        bookings: bookings ?? this.bookings,
        doctorBookings: doctorBookings ?? this.doctorBookings,
        selected: selected ?? this.selected,
      );
}
