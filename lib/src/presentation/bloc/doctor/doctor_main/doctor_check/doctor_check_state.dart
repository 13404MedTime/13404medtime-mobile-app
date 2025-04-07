part of 'doctor_check_bloc.dart';

class DoctorCheckState extends Equatable {
  const DoctorCheckState({
    this.isLoading = false,
    this.appointments = const [],
    this.users = const {},
  });

  final bool isLoading;
  final List<Appointment> appointments;
  final Map<String, List<Appointment>> users;

  @override
  List<Object?> get props => [
        isLoading,
        appointments,
        users,
      ];

  DoctorCheckState copyWith({
    bool? isLoading,
    List<Appointment>? appointments,
    Map<String, List<Appointment>>? users,
  }) =>
      DoctorCheckState(
        isLoading: isLoading ?? this.isLoading,
        appointments: appointments ?? this.appointments,
        users: users ?? this.users,
      );
}
