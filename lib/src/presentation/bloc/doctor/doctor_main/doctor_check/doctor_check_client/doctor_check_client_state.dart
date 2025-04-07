part of 'doctor_check_client_bloc.dart';

class DoctorCheckClientState extends Equatable {
  const DoctorCheckClientState({
    this.isLoading = false,
    this.medicines = const [],
    this.sorted = const {},
    this.user,
  });

  final bool isLoading;
  final List<ResponseItem> medicines;
  final Map<String, List<ResponseItem>> sorted;
  final ClientData? user;

  @override
  List<Object?> get props => [
        isLoading,
        medicines,
        sorted,
        user,
      ];

  DoctorCheckClientState copyWith({
    bool? isLoading,
    List<ResponseItem>? medicines,
    Map<String, List<ResponseItem>>? sorted,
    ClientData? user,
  }) =>
      DoctorCheckClientState(
        isLoading: isLoading ?? this.isLoading,
        medicines: medicines ?? this.medicines,
        sorted: sorted ?? this.sorted,
        user: user ?? this.user,
      );
}
