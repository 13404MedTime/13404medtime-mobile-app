part of 'add_medicine_bloc.dart';

class AddMedicineState extends Equatable {
  const AddMedicineState({
    this.medicineNameTextFieldStatus = MedicineNameTextFieldStatus.disable,
    this.selectedDrug,
    this.metrics = const [],
    this.isReceivedMetrics = false,
    this.isLoadingMetrics = false,
    this.metricIndex,
    this.medicationWeekdays = const [],
    this.medicineWeekdayStatus,
    this.currentStep = 0,
    this.medicineName = '',
    this.timeTakeMedicine = 'beforeMeals',
    this.medicineQuantity = '10',
    this.medicineDosage = '1',
    this.medicineTakeHourMinute = const ['08:30'],
    this.isLoading = false,
    this.isReceived = false,
  });

  /// ----------- Add Medicine Page Items -----------

  final int currentStep;

  /// ----------- Add Medicine Name And Type Page Items -----------

  final MedicineNameTextFieldStatus medicineNameTextFieldStatus;
  final String medicineName;
  final int? metricIndex;
  final DrugModel? selectedDrug;
  final List<MetricModel> metrics;
  final bool isLoadingMetrics;
  final bool isReceivedMetrics;

  /// ----------- Add Medicine Time Take Page Items -----------

  final MedicineWeekdayStatus? medicineWeekdayStatus;

  final List<int> medicationWeekdays;

  /// ----------- Add Medicine Quantity And Tme Page -----------

  final String timeTakeMedicine;
  final String medicineQuantity;
  final String medicineDosage;
  final List<String> medicineTakeHourMinute;

  final bool isLoading;
  final bool isReceived;

  AddMedicineState copyWith({
    final MedicineNameTextFieldStatus? medicineNameTextFieldStatus,
    final ValueGetter<DrugModel?>? selectedDrug,
    final MedicineWeekdayStatus? medicineWeekdayStatus,
    final List<int>? medicationWeekdays,
    final int? currentStep,
    final String? medicineName,
    final List<MetricModel>? metrics,
    final bool? isReceivedMetrics,
    final bool? isLoadingMetrics,
    final int? metricIndex,
    final String? timeTakeMedicine,
    final String? medicineQuantity,
    final String? medicineDosage,
    final List<String>? medicineTakeHourMinute,
    final bool? isLoading,
    final bool? isReceived,
  }) =>
      AddMedicineState(
        medicineNameTextFieldStatus: medicineNameTextFieldStatus ?? this.medicineNameTextFieldStatus,
        metrics: metrics ?? this.metrics,
        isReceivedMetrics: isReceivedMetrics ?? this.isReceivedMetrics,
        isLoadingMetrics: isLoadingMetrics ?? this.isLoadingMetrics,
        selectedDrug: selectedDrug != null ? selectedDrug() : this.selectedDrug,
        metricIndex: metricIndex ?? this.metricIndex,
        // isVisibleSeveralTimesDay:
        //     isVisibleSeveralTimesDay ?? this.isVisibleSeveralTimesDay,
        // isVisibleConstantly: isVisibleConstantly ?? this.isVisibleConstantly,
        // isVisibleSpecificDaysWeek:
        //     isVisibleSpecificDaysWeek ?? this.isVisibleSpecificDaysWeek,
        // medicineWeakDays: medicineWeakDays ?? this.medicineWeakDays,
        medicationWeekdays: medicationWeekdays ?? this.medicationWeekdays,
        medicineWeekdayStatus: medicineWeekdayStatus ?? this.medicineWeekdayStatus,
        currentStep: currentStep ?? this.currentStep,
        medicineName: medicineName ?? this.medicineName,
        timeTakeMedicine: timeTakeMedicine ?? this.timeTakeMedicine,
        medicineQuantity: medicineQuantity ?? this.medicineQuantity,
        medicineDosage: medicineDosage ?? this.medicineDosage,
        medicineTakeHourMinute: medicineTakeHourMinute ?? this.medicineTakeHourMinute,
        isLoading: isLoading ?? this.isLoading,
        isReceived: isReceived ?? this.isReceived,
      );

  @override
  List<Object?> get props => [
        medicineNameTextFieldStatus,
        selectedDrug,
        medicationWeekdays,
        medicineWeekdayStatus,
        currentStep,
        medicineName,
        metrics,
        isReceivedMetrics,
        isLoadingMetrics,
        metricIndex,
        timeTakeMedicine,
        medicineQuantity,
        medicineDosage,
        medicineTakeHourMinute,
        isLoading,
        isReceived,
      ];
}

enum MedicineNameTextFieldStatus { disable, enable }

extension MedicineNameTextFieldStatusX on MedicineNameTextFieldStatus {
  bool get isDisable => this == MedicineNameTextFieldStatus.disable;

  bool get isEnable => this == MedicineNameTextFieldStatus.enable;
}

enum MedicineWeekdayStatus { severalDay, selectedDays, allDays }

extension MedicineWeekdayStatusExtention on MedicineWeekdayStatus {
  bool get isSeveralDay => this == MedicineWeekdayStatus.severalDay;

  bool get isSelectedDays => this == MedicineWeekdayStatus.selectedDays;

  bool get isAllDays => this == MedicineWeekdayStatus.allDays;
}

final List<WeekdayModel> weekdays = [
  WeekdayModel(
    index: 1,
    name: 'mon',
  ),
  WeekdayModel(
    index: 2,
    name: 'tue',
  ),
  WeekdayModel(
    index: 3,
    name: 'wed',
  ),
  WeekdayModel(
    index: 4,
    name: 'thu',
  ),
  WeekdayModel(
    index: 5,
    name: 'fri',
  ),
  WeekdayModel(
    index: 6,
    name: 'sat',
  ),
  WeekdayModel(
    index: 0,
    name: 'sun',
  ),
];

class WeekdayModel {
  WeekdayModel({
    required this.index,
    required this.name,
  });

  final int index;
  final String name;
}
