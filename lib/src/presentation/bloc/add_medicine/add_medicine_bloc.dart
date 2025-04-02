import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/router/app_routes.dart';
import '../../../data/models/add_medicine/get_drugs/get_drugs_response.dart';
import '../../../data/models/add_medicine/metrics/metrics_response.dart';
import '../../../domain/repositories/add_medicine/add_medicine_repository.dart';

part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  AddMedicineBloc(this._repository) : super(const AddMedicineState()) {
    on<MedicineNameTextFieldEvent>(_medicineNameTextField);
    on<GetMetricsEvent>(_getMetrics);
    on<MetricIndexEvent>(_updateMetricIndex);
    on<DrugSelectedEvent>(_selectDrug);
    on<ChangeMedicationDayTypeEvent>(_changeMedicationDayType);
    on<ChangeMedicationDaysEvent>(_changeMedicationDays);
    on<ChangeCurrentPageEvent>(_changeCurrentPage);
    on<SetTimeTakeMedicineEvent>(_setTimeTakeMedicine);
    on<SetMedicineQuantityEvent>(_setMedicineQuantity);
    on<SetMedicineDosageEvent>(_setMedicineDosage);
    on<SetMedicineTakeHourMinuteEvent>(_setMedicineTakeHourMinute);
    on<DeleteMedicineTakeHourMinuteEvent>(_deleteMedicineTakeHourMinute);
    on<UpdateMedicineTakeHourMinuteEvent>(_updateMedicineTakeHourMinute);
    on<SaveMedicationEvent>(_saveMedication);
  }

  final AddMedicineRepository _repository;

  /// ----------- Add Medicine Page Functions -----------

  void _changeCurrentPage(
    ChangeCurrentPageEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    emit(
      state.copyWith(
        currentStep: event.index,
      ),
    );
  }

  /// ----------- Add Medicine Name Page Functions -----------

  void _medicineNameTextField(
    MedicineNameTextFieldEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    if (event.medicineName.isNotEmpty) {
      emit(
        state.copyWith(
          medicineNameTextFieldStatus: MedicineNameTextFieldStatus.enable,
          medicineName: event.medicineName,
          selectedDrug: event.medicineName != state.medicineName && state.selectedDrug != null
              ? () => null
              : () => event.selectedDrug,
        ),
      );
    } else {
      emit(
        state.copyWith(
          medicineNameTextFieldStatus: MedicineNameTextFieldStatus.disable,
          selectedDrug: event.medicineName != state.medicineName && state.selectedDrug != null ? () => null : null,
        ),
      );
    }
  }

  Future<void> _getMetrics(
    GetMetricsEvent event,
    Emitter<AddMedicineState> emit,
  ) async {
    emit(state.copyWith(isLoadingMetrics: true));
    final response = await _repository.getMetrics();
    response.fold(
      (left) => emit(state.copyWith(
        isLoadingMetrics: false,
      )),
      (r) => emit(state.copyWith(
        metrics: r.metrics,
        isReceivedMetrics: true,
        isLoadingMetrics: false,
      )),
    );
  }

  Future<void> _updateMetricIndex(
    MetricIndexEvent event,
    Emitter<AddMedicineState> emit,
  ) async {
    emit(state.copyWith(
      metricIndex: event.index,
    ));
  }

  void _selectDrug(
    DrugSelectedEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    emit(state.copyWith(selectedDrug: () => event.drug));
  }

  /// ----------- Add Medicine Time Take Page Functions -----------

  void _changeMedicationDayType(
    ChangeMedicationDayTypeEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    emit(state.copyWith(
      medicineWeekdayStatus: event.medicineWeekdayStatus,
      medicationWeekdays: !event.medicineWeekdayStatus.isSelectedDays ? [for (int i = 0; i < 7; i++) i] : [],
    ));
  }

  void _changeMedicationDays(
    ChangeMedicationDaysEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    final List<int> list = [...state.medicationWeekdays];
    if (state.medicationWeekdays.contains(event.dayIndex)) {
      list.remove(event.dayIndex);
    } else {
      list.add(event.dayIndex);
    }
    emit(state.copyWith(medicationWeekdays: list));
  }

  // void _isVisibleSeveralTimeTake(
  //   IsVisibleSeveralTimeTakeEvent event,
  //   Emitter<AddMedicineState> emit,
  // ) {
  //   emit(
  //     state.copyWith(
  //       isVisibleSeveralTimesDay: !state.isVisibleSeveralTimesDay,
  //     ),
  //   );
  // }
  //
  // void _isVisibleConstantly(
  //   IsVisibleConstantlyEvent event,
  //   Emitter<AddMedicineState> emit,
  // ) {
  //   emit(
  //     state.copyWith(
  //       isVisibleConstantly: !state.isVisibleConstantly,
  //     ),
  //   );
  // }
  //
  // void _isVisibleSpecificDayWeek(
  //   IsVisibleSpecificDayWeekEvent event,
  //   Emitter<AddMedicineState> emit,
  // ) {
  //   emit(
  //     state.copyWith(
  //       isVisibleSpecificDaysWeek: !state.isVisibleSpecificDaysWeek,
  //     ),
  //   );
  // }
  //
  // void _setYourWeakDays(
  //   SetYourWeakDaysEvent event,
  //   Emitter<AddMedicineState> emit,
  // ) {
  //   final List<String> weakDays = List.from(state.medicineWeakDays);
  //   if (state.medicineWeakDays.contains(event.weakDays)) {
  //     weakDays.remove(event.weakDays);
  //   } else {
  //     weakDays.add(event.weakDays);
  //   }
  //   emit(
  //     state.copyWith(
  //       medicineWeakDays: weakDays,
  //     ),
  //   );
  //   debugPrint('weakDays: $state.weakDays');
  // }

  /// ----------- Add Medicine Quantity And Tme Page -----------

  void _setTimeTakeMedicine(
    SetTimeTakeMedicineEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    emit(
      state.copyWith(
        timeTakeMedicine: event.timeTakeMedicine,
      ),
    );
  }

  void _setMedicineQuantity(
    SetMedicineQuantityEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    emit(
      state.copyWith(
        medicineQuantity: event.medicineQuantity,
      ),
    );
  }

  void _setMedicineDosage(
    SetMedicineDosageEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    emit(
      state.copyWith(
        medicineDosage: event.medicineDosage,
      ),
    );
  }

  void _setMedicineTakeHourMinute(
    SetMedicineTakeHourMinuteEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    final List<String> medicineTakeHourMinute = List.from(state.medicineTakeHourMinute);
    if (state.medicineTakeHourMinute.contains(event.medicineTakeHourMinute)) {
      return;
    } else {
      medicineTakeHourMinute.add(event.medicineTakeHourMinute);
    }
    emit(
      state.copyWith(
        medicineTakeHourMinute: medicineTakeHourMinute,
      ),
    );
  }

  void _deleteMedicineTakeHourMinute(
    DeleteMedicineTakeHourMinuteEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    final List<String> medicineTakeHourMinute = List.from(state.medicineTakeHourMinute);
    if (state.medicineTakeHourMinute.contains(event.medicineTakeHourMinute)) {
      medicineTakeHourMinute.remove(event.medicineTakeHourMinute);
    } else {
      return;
    }
    emit(
      state.copyWith(
        medicineTakeHourMinute: medicineTakeHourMinute,
      ),
    );
  }

  void _updateMedicineTakeHourMinute(
    UpdateMedicineTakeHourMinuteEvent event,
    Emitter<AddMedicineState> emit,
  ) {
    final List<String> medicineTakeHourMinute = List.from(state.medicineTakeHourMinute);
    medicineTakeHourMinute[event.index] = event.medicineTakeHourMinute;
    emit(
      state.copyWith(
        medicineTakeHourMinute: medicineTakeHourMinute,
      ),
    );
  }

  Future<void> _saveMedication(
    SaveMedicationEvent event,
    Emitter<AddMedicineState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final List<String> medicineTimes =
        List.generate(state.medicineTakeHourMinute.length, (index) => '${state.medicineTakeHourMinute[index]}:00')
          ..sort((a, b) {
            final List<String> timeA = a.split(':');
            final List<String> timeB = b.split(':');

            final int hourA = int.parse(timeA[0]);
            final int minuteA = int.parse(timeA[1]);

            final int hourB = int.parse(timeB[0]);
            final int minuteB = int.parse(timeB[1]);

            if (hourA != hourB) {
              return hourA.compareTo(hourB);
            } else {
              return minuteA.compareTo(minuteB);
            }
          });
    late final String? frequency;
    switch (state.medicineWeekdayStatus) {
      case MedicineWeekdayStatus.severalDay:
        frequency = 'several_times_day';
      case MedicineWeekdayStatus.selectedDays:
        frequency = 'specific_days';
      case MedicineWeekdayStatus.allDays:
        frequency = 'always';
      case null:
        frequency = null;
    }
    late final String? description;
    switch (state.timeTakeMedicine) {
      case 'beforeMeals':
        description = 'before_food';
      case 'whileEating':
        description = 'during_food';
      case 'afterMeals':
        description = 'after_food';
    }
    final response = await _repository.saveMedication({
      'data': {
        'cleints_id': localSource.userId,
        if (state.selectedDrug != null) 'preparati_id': state.selectedDrug?.guid,
        if (state.selectedDrug == null) 'medicine_name': state.medicineName,
        'unit_of_measure_id': state.metrics[state.metricIndex!].guid,
        'frequency': [frequency],
        'week_days':
            List.generate(state.medicationWeekdays.length, (index) => state.medicationWeekdays[index].toString()),
        'json_body': jsonEncode({'hours_of_day': medicineTimes}),
        'dosage': num.tryParse(state.medicineDosage),
        'current_amount': num.tryParse(state.medicineQuantity),
        'description': [description],
        'is_from_patient': true,
      }
    });
    response.fold(
      (left) => emit(state.copyWith(
        isLoading: false,
        isReceived: true,
      )),
      (right) => emit(state.copyWith(
        isLoading: false,
        isReceived: true,
      )),
    );
  }
}
