import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/extension/extension.dart';
import '../../../data/models/home/get_medical_history/get_medical_history_request.dart';
import '../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../data/models/purpose/medication_times.dart';
import '../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../domain/repositories/home/home_repository.dart';

part 'purpose_bloc.freezed.dart';
part 'purpose_event.dart';
part 'purpose_state.dart';

class PurposeBloc extends Bloc<PurposeEvent, PurposeState> {
  PurposeBloc(this.repository) : super(const PurposeState()) {
    on<GetMedicalByDoctor>(_getMedicalByDoctor);
    on<AddMedicalByDoctor>(_addMedicalByDoctor);
  }

  HomeRepository repository;

  Future<void> _getMedicalByDoctor(GetMedicalByDoctor event, Emitter<PurposeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getMedicalHistory(GetMedicalHistoryRequest(
      data: {
        'data': {
          'offset': 0,
          'limit': 10,
          'with_relations': true,
          'cleints_id': [localSource.userId],
          'doctor_id': event.doctorId,
        }
      },
    ));
    await response.fold(
      (error) async => emit(state.copyWith(isAdding: false)),
      (r) async {
        final List<String> naznachenieIds = [];
        for (final NaznachenieIdData data in r.medicalHistory ?? []) {
          if (data.guid != null) {
            naznachenieIds.add(data.guid!);
          }
        }
        if (naznachenieIds.isNotEmpty) {
          await Future.wait([
            _getMedicineNames(naznachenieIds, emit),
            _getMedicationTimes(naznachenieIds, emit),
          ]);
        }
        emit(state.copyWith(
          isLoading: false,
          medicalHistory: r.medicalHistory ?? state.medicalHistory,
        ));
      },
    );
  }

  Future<void> _addMedicalByDoctor(AddMedicalByDoctor event, Emitter<PurposeState> emit) async {
    emit(state.copyWith(isAdding: true));
    final response = await repository.getMedicalHistory(GetMedicalHistoryRequest(
      data: {
        'data': {
          'offset': state.medicalHistory.length,
          'limit': 5,
          'with_relations': true,
          'cleints_id': [localSource.userId],
          'doctor_id': event.doctorId,
        }
      },
    ));
    await response.fold(
      (error) async => emit(state.copyWith(isAdding: false)),
      (r) async {
        final List<String> naznachenieIds = [];
        for (final NaznachenieIdData data in r.medicalHistory ?? []) {
          if (data.guid != null) {
            naznachenieIds.add(data.guid!);
          }
        }
        if (naznachenieIds.isNotEmpty) {
          await Future.wait([
            _getMedicineNames(naznachenieIds, emit, isForAdd: true),
            _getMedicationTimes(naznachenieIds, emit, isForAdd: true),
          ]);
        }
        emit(state.copyWith(
          isAdding: false,
          medicalHistory: [...state.medicalHistory, ...r.medicalHistory ?? []],
        ));
      },
    );
  }

  Future<void> _getMedicineNames(final List<String> naznachenieIds, final Emitter<PurposeState> emit,
      {final bool isForAdd = false}) async {
    final response = await repository.getMedicineTaking(
      jsonEncode({
        'cleints_id': [localSource.userId],
        'is_from_patient': false,
        'naznachenie_id': naznachenieIds,
        'offset': 0,
        'with_relations': true,
      }),
    );
    response.fold(
      (error) => null,
      (r) {
        final Map<String, List<String>> names = {};
        final Map<String, MedicineTakingModel> drugs = {};
        for (final MedicineTakingModel data in r.medicineTaking ?? []) {
          if (data.naznachenieId != null && data.guid != null) {
            drugs[data.guid!] = data;
            if (!names.containsKey(data.naznachenieId)) {
              names[data.naznachenieId!] = [];
            }
            names[data.naznachenieId!]?.add(((data.preparatiId ?? '').isEmpty
                    ? data.medicineName
                    : data.preparatiIdData?.brandName?.replaceAll('\n', '')) ??
                '');
          }
        }
        emit(state.copyWith(
          medicalHistoryDrugNames: isForAdd ? {...state.medicalHistoryDrugNames, ...names} : names,
          medicalHistoryDrugs: isForAdd ? {...state.medicalHistoryDrugs, ...drugs} : drugs,
        ));
      },
    );
  }

  Future<void> _getMedicationTimes(
    final List<String> naznachenieIds,
    final Emitter<PurposeState> emit, {
    final bool isForAdd = false,
  }) async {
    final response = await repository.getMedication({
      'data': {
        'naznachenie_id': naznachenieIds,
        'time_take': {
          '\$gte': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).toIso8601String(),
          '\$lt': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).add(const Duration(days: 1)).toIso8601String(),
        }
      }
    });
    response.fold(
      (error) => null,
      (r) {
        final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes = {};
        final DateTime now = DateTime.now();
        for (int i = 0; i < (r.medications?.length ?? 0); i++) {
          if (r.medications![i].timeTake != null) {
            final DateTime? date = r.medications![i].timeTake?.toDateTime;
            if (date != null) {
              r.medications![i].timeTake = date.add(const Duration(hours: 5)).formatDateTime;
            }
          }
        }
        r.medications?.sort((a, b) {
          final DateTime? dateA = a.timeTake?.toDateTime;
          final DateTime? dateB = b.timeTake?.toDateTime;
          return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
        });
        for (final MyAppointModel data in r.medications ?? []) {
          if (data.naznachenieId != null && data.timeTake != null) {
            if (!medicationTimes.containsKey(data.naznachenieId)) {
              medicationTimes[data.naznachenieId!] = [];
            }
            final DateTime? dateTime = data.timeTake?.toDateTime;
            if (dateTime != null) {
              if (dateTime.day == now.day) {
                medicationTimes[data.naznachenieId]?.add(
                  SubPurposeMedicationTimesItem(
                    data: data,
                    time: dateTime.toHHmm,
                  ),
                );
              }
            }
          }
        }
        emit(state.copyWith(
          medicationTimes: isForAdd ? {...medicationTimes, ...state.medicationTimes} : medicationTimes,
        ));
      },
    );
  }
}
