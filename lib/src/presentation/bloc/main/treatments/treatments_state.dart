part of 'treatments_bloc.dart';

class TreatmentsState extends Equatable {
  const TreatmentsState({
    this.medicineTakingList = const [],
    this.medicineCount = 0,
    this.unitOfMissures = const {},
    this.isLoading = false,
    this.isAdding = false,
    this.homeUpdate = false,
  });

  TreatmentsState copyWith({
    final List<MedicineTakingModel>? medicineTakingList,
    final int? medicineCount,
    final Map<String, MetricModel>? unitOfMissures,
    final bool? isLoading,
    final bool? isAdding,
    final bool homeUpdate = false,
  }) =>
      TreatmentsState(
        medicineTakingList: medicineTakingList ?? this.medicineTakingList,
        medicineCount: medicineCount ?? this.medicineCount,
        unitOfMissures: unitOfMissures ?? this.unitOfMissures,
        isLoading: isLoading ?? this.isLoading,
        isAdding: isAdding ?? this.isAdding,
        homeUpdate: homeUpdate,
      );

  final List<MedicineTakingModel> medicineTakingList;
  final int medicineCount;
  final Map<String, MetricModel> unitOfMissures;
  final bool isLoading;
  final bool isAdding;
  final bool homeUpdate;

  @override
  List<Object> get props => [
        medicineTakingList,
        medicineCount,
        unitOfMissures,
        isLoading,
        isAdding,
        homeUpdate,
      ];
}

// @freezed
// class TreatmentsState with _$TreatmentsState {
//   const factory TreatmentsState({
//     @Default([]) List<MedicineTakingModel> medicineTakingList,
//     @Default(false) bool isLoading,
//     @Default(null) bool? homeUpdate,
// }) = _TreatmentsState;
// }
