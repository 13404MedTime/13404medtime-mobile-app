part of 'doctor_home_bloc.dart';

class DoctorHomeState extends Equatable {
  const DoctorHomeState({
    this.isLoading = false,
    this.isLoadingAdd = false,
    this.selectedSegments = const <int>{0},
    this.bookings = const [],
    this.freeBookings = const [],
    this.busyBookings = const [],
    this.requests = const [],
    this.filteredRequests = const [],
  });

  final bool isLoading;
  final bool isLoadingAdd;
  final Set<int> selectedSegments;
  final List<DoctorBooking> bookings;
  final List<DoctorBooking> freeBookings;
  final List<DoctorBooking> busyBookings;
  final List<BookingResponse> requests;
  final List<BookingResponse> filteredRequests;

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingAdd,
        selectedSegments,
        bookings,
        freeBookings,
        busyBookings,
        requests,
    filteredRequests,
      ];

  DoctorHomeState copyWith({
    bool? isLoading,
    bool? isLoadingAdd,
    Set<int>? selectedSegments,
    List<DoctorBooking>? bookings,
    List<DoctorBooking>? freeBookings,
    List<DoctorBooking>? busyBookings,
    List<BookingResponse>? requests,
    List<BookingResponse>? filteredRequests,
  }) =>
      DoctorHomeState(
        isLoading: isLoading ?? this.isLoading,
        isLoadingAdd: isLoadingAdd ?? this.isLoadingAdd,
        selectedSegments: selectedSegments ?? this.selectedSegments,
        bookings: bookings ?? this.bookings,
        freeBookings: freeBookings ?? this.freeBookings,
        busyBookings: busyBookings ?? this.busyBookings,
        requests: requests ?? this.requests,
        filteredRequests: filteredRequests ?? this.filteredRequests,
      );
}
