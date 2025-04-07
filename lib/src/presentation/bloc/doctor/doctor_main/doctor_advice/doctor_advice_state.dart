part of 'doctor_advice_bloc.dart';

class DoctorAdviceState extends Equatable {
  const DoctorAdviceState({
    this.isLoading = false,
    this.clients = const [],
    this.medicines = const [],
    this.selectedClient,
    this.selectedMedicine,
    this.selectedPage = 0,
    this.medicinesInfo = const [],
    this.adviceId = '',
    this.units = const [],
    this.medicinesName = const [],
  });

  final bool isLoading;
  final List<Client> clients;
  final List<MedicineResponse> medicines;
  final Client? selectedClient;
  final MedicineResponse? selectedMedicine;
  final int selectedPage;
  final List<MedicineInformation> medicinesInfo;
  final String adviceId;
  final List<UnitOfMedicine> units;
  final List<Medicine> medicinesName;

  @override
  List<Object?> get props => [
        isLoading,
        clients,
        medicines,
        selectedClient,
        selectedMedicine,
        selectedPage,
        medicinesInfo,
        adviceId,
        units,
        medicinesName,
      ];

  DoctorAdviceState copyWith({
    bool? isLoading,
    List<Client>? clients,
    List<MedicineResponse>? medicines,
    Client? selectedClient,
    MedicineResponse? selectedMedicine,
    int? selectedPage,
    List<MedicineInformation>? medicinesInfo,
    String? adviceId,
    List<UnitOfMedicine>? units,
    List<Medicine>? medicinesName,
  }) =>
      DoctorAdviceState(
        isLoading: isLoading ?? this.isLoading,
        clients: clients ?? this.clients,
        medicines: medicines ?? this.medicines,
        selectedClient: selectedClient ?? this.selectedClient,
        selectedMedicine: selectedMedicine ?? this.selectedMedicine,
        selectedPage: selectedPage ?? this.selectedPage,
        medicinesInfo: medicinesInfo ?? this.medicinesInfo,
        adviceId: adviceId ?? this.adviceId,
        units: units ?? this.units,
        medicinesName: medicinesName ?? this.medicinesName,
      );
}
