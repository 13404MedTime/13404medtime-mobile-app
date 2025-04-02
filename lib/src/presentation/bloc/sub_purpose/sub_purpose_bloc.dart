import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/extension/extension.dart';
import '../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../data/models/purpose/files_response.dart';
import '../../../data/models/purpose/medication_times.dart';
import '../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../domain/repositories/home/home_repository.dart';

part 'sub_purpose_bloc.freezed.dart';
part 'sub_purpose_event.dart';
part 'sub_purpose_state.dart';

class SubPurposeBloc extends Bloc<SubPurposeEvent, SubPurposeState> {
  SubPurposeBloc(this.repository) : super(const SubPurposeState()) {
    on<GetMedicationDataEvent>(_getMedicationData);
    // on<GetAllPrepartsOfNaznachenie>(_getAllPreparatsOfNaznachenie);
    // on<GetMedicationTimes>(_getMedicationTimes);
    on<GetFilesEvent>(_getFiles);
  }

  HomeRepository repository;

  Future<void> _getMedicationData(GetMedicationDataEvent event, Emitter<SubPurposeState> emit) async {
    emit(state.copyWith(status: SubPurposeStatus.loading));
    await Future.wait([
      _getAllPreparatsOfNaznachenie(event.naznachenieId, emit),
      _getMedicationTimes(event.naznachenieId, emit),
    ]);
    if (state.status != SubPurposeStatus.error) {
      emit(state.copyWith(status: SubPurposeStatus.success));
    }
  }

  /// -----------------------------------------------

  Future<void> _getAllPreparatsOfNaznachenie(final String naznachenieId, final Emitter<SubPurposeState> emit) async {
    final response = await repository.getMedicineTaking(
      jsonEncode({
        'cleints_id': [localSource.userId],
        'naznachenie_id': [naznachenieId],
        'offset': 0,
      }),
    );
    response.fold(
      (error) => null,
      (r) {
        debugPrint('getAllPreparatsOfNaznachenie-----> ${r.medicineTaking?[0].medicineName}');
        debugPrint('photos-----> ${r.medicineTaking?[0].photo}');

        emit(
          state.copyWith(
            allPreparatsOfNaznachenie: r.medicineTaking ?? state.allPreparatsOfNaznachenie,
          ),
        );
      },
    );
  }

  Future<void> _getMedicationTimes(final String naznachenieId, final Emitter<SubPurposeState> emit) async {
    final response = await repository.getMedication(
      {
        'data': {
          'offset': 0,
          'naznachenie_id': [naznachenieId],
          'time_take': {
            '\$gte': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).toIso8601String(),
            '\$lt':
                DateTime.now().copyWith(hour: 0, minute: 0, second: 0).add(const Duration(days: 2)).toIso8601String()
          }
        }
      },
    );
    response.fold(
      (error) => null,
      (r) {
        final Map<String, SubPurposeMedicationTimes> medicationTimes = {};
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
          if (data.medicineTakingId != null && data.timeTake != null) {
            if (!medicationTimes.containsKey(data.medicineTakingId)) {
              medicationTimes[data.medicineTakingId!] = SubPurposeMedicationTimes(
                today: [],
                tomorrow: [],
              );
            }
            final DateTime? dateTime = data.timeTake?.toDateTime;
            if (dateTime != null) {
              if (dateTime.day == now.day) {
                medicationTimes[data.medicineTakingId]?.today.add(
                      SubPurposeMedicationTimesItem(
                        data: data,
                        time: dateTime.toHHmm,
                      ),
                    );
              } else if (dateTime.day == now.add(const Duration(days: 1)).day) {
                medicationTimes[data.medicineTakingId]?.tomorrow.add(
                      SubPurposeMedicationTimesItem(
                        data: data,
                        time: dateTime.toHHmm,
                      ),
                    );
              }
            }
          }
        }
        emit(state.copyWith(medicationTimes: medicationTimes));
      },
    );
  }

  Future<void> _getFiles(GetFilesEvent event, Emitter<SubPurposeState> emit) async {
    emit(state.copyWith(
      isLoadingFiles: true,
    ));
    final response = await repository.getFiles(
      {
        'data': {
          'limit': 100,
          'offset': 0,
          'with_relations': true,
          'naznachenie_id': [event.naznachenieId]
        }
      },
    );
    response.fold(
      (error) => emit(state.copyWith(
        isLoadingFiles: false,
      )),
      (r) {
        final Map<String, List<FileModel>> files = {};
        for (final FileModel file in r.files ?? []) {
          if (file.createdDate != null) {
            final dateTime = file.createdDate!.ddMMyyyy;
            if (files.containsKey(dateTime)) {
              files[dateTime]?.add(file);
            } else {
              files[dateTime] = [file];
            }
          }
        }
        emit(state.copyWith(
          files: files,
          isLoadingFiles: false,
        ));
      },
    );
  }
}

enum SubPurposeStatus { inital, loading, success, error }
