import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/add_medicine/metrics/metrics_response.dart';
import '../../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../../domain/repositories/treatments/treatments_repository.dart';

part 'treatments_bloc.freezed.dart';
part 'treatments_event.dart';
part 'treatments_state.dart';

class TreatmentsBloc extends Bloc<TreatmentsEvent, TreatmentsState> {
  TreatmentsBloc(this.repository) : super(const TreatmentsState()) {
    on<GetMedicineTakingMenuEvent>(_getMedicineTakingMenu);
    on<GetMedicineTakingEvent>(_getMedicineTaking);
    on<AddMedicineTakingEvent>(_addMedicineTaking);
    on<DeleteMedicineEvent>(_deleteMedicine);
    on<UpdateMedicineTakingEvent>(_getMedicineUpdateTaking);
  }

  TreatmentsRepository repository;

  Future<void> _getMedicineTakingMenu(
    GetMedicineTakingMenuEvent event,
    Emitter<TreatmentsState> emit,
  ) async {
    await _medicineTaking(emit);
  }

  Future<void> _getMedicineTaking(
    GetMedicineTakingEvent event,
    Emitter<TreatmentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.wait([_medicineTaking(emit), _getUnitOfMissures(emit)]);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _getMedicineUpdateTaking(
    UpdateMedicineTakingEvent event,
    Emitter<TreatmentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await _medicineTaking(emit);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _addMedicineTaking(
    AddMedicineTakingEvent event,
    Emitter<TreatmentsState> emit,
  ) async {
    emit(state.copyWith(isAdding: true));
    await _medicineTaking(emit, isForAdd: true);
    emit(state.copyWith(isAdding: false));
  }

  Future<void> _deleteMedicine(
    DeleteMedicineEvent event,
    Emitter<TreatmentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final medicineId = state.medicineTakingList[event.index].guid;
    final result = await repository.deleteMedicine(medicineId ?? '');
    await result.fold(
      (left) async {
        emit(state.copyWith(isLoading: false));
      },
      (right) async {
        final response = await repository.getMedicineTaking(
          limit: 10,
          offset: 0,
        );
        response.fold(
          (error) => emit(state.copyWith(isLoading: false)),
          (r) => emit(state.copyWith(
            isLoading: false,
            medicineTakingList: r.medicineTaking ?? state.medicineTakingList,
            homeUpdate: true,
          )),
        );
      },
    );
  }

  /// -----------------------------------------------

  Future<void> _getUnitOfMissures(
    Emitter<TreatmentsState> emit,
  ) async {
    final response = await repository.getMetrics();
    emit(state.copyWith(
      unitOfMissures: response.fold<Map<String, MetricModel>?>(
        (error) => null,
        (r) => r.metrics != null ? {for (final data in r.metrics!) data.guid ?? '': data} : null,
      ),
    ));
  }

  Future<void> _medicineTaking(
    Emitter<TreatmentsState> emit, {
    final bool isForAdd = false,
  }) async {
    if ((state.medicineTakingList.length == state.medicineCount) && isForAdd) return;
    final response = await repository.getMedicineTaking(
      limit: isForAdd ? 5 : 10,
      offset: isForAdd ? state.medicineTakingList.length : 0,
    );
    // final List<MedicineTakingModel> list =
    //     response.fold<List<MedicineTakingModel>>(
    //         (error) => [], (r) => r.medicineTaking ?? []);
    response.fold((error) {}, (r) {
      emit(state.copyWith(
        medicineCount: r.count,
        medicineTakingList:
            isForAdd ? [...state.medicineTakingList, ...r.medicineTaking ?? []] : r.medicineTaking ?? [],
      ));
    });
  }
}
