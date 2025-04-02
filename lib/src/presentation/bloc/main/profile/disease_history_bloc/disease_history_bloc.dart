import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/consultation/doctors_types_response.dart';
import '../../../../../data/models/home/get_medical_history/get_medical_history_request.dart';
import '../../../../../data/models/home/get_searched/get_searched_request.dart';
import '../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../../data/models/purpose/medication_times.dart';
import '../../../../../data/models/search_model/search_appointments_response.dart';
import '../../../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../../../domain/repositories/home/home_repository.dart';
import '../../../../../domain/repositories/search/search_repository.dart';

part 'disease_history_bloc.freezed.dart';
part 'disease_history_event.dart';
part 'disease_history_state.dart';

class DiseaseHistoryBloc extends Bloc<DiseaseHistoryEvent, DiseaseHistoryState> {
  DiseaseHistoryBloc(
    this.searchRepository,
    this.homeRepository,
  ) : super(const DiseaseHistoryState()) {
    on<Started>(_started);
    on<GetSearchedItemsEvent>(_getSearchedItems);
    on<ScrollGetListEvent>(_scrollGetList);
  }

  final SearchRepository searchRepository;
  final HomeRepository homeRepository;

  Future<void> _started(Started event, Emitter<DiseaseHistoryState> emit) async {
    emit(
      state.copyWith(
        isLoading: false,
        diseaseItemsList: event.diseaseItemsList,
        medicationTimes: event.medicationTimes,
        medicalHistoryDrugs: event.medicalHistoryDrugs,
        medicalHistoryDrugNames: event.medicalHistoryDrugNames,
      ),
    );
  }

  Future<void> _scrollGetList(ScrollGetListEvent event, Emitter<DiseaseHistoryState> emit) async {
    emit(state.copyWith(isScrollLoading: true));
    final response = await homeRepository.getMedicalHistory(GetMedicalHistoryRequest(
      data: {
        'data': {
          'cleints_id': [localSource.userId],
          'offset': state.diseaseItemsList.length,
          'limit': 5,
        }
      },
    ));
    await response.fold(
      (error) {
        emit(state.copyWith(
          isScrollLoading: false,
        ));
      },
      (r) async {
        final List<String> naznachenieIds = [];
        for (int i = 0; i < (r.medicalHistory?.length ?? 0); i++) {
          if (r.medicalHistory?[i].guid != null) {
            naznachenieIds.add(r.medicalHistory![i].guid!);
          }
        }
        if (naznachenieIds.isNotEmpty) {
          await Future.wait([
            _getMedicineNames(naznachenieIds, emit, isForAdd: true),
            _getMedicationTimes(naznachenieIds, emit, isForAdd: true),
          ]);
        }
        emit(state.copyWith(
          isScrollLoading: false,
          diseaseItemsList: [...state.diseaseItemsList, ...r.medicalHistory ?? []],
        ));
      },
    );
  }

  ///
  Future<void> _getSearchedItems(
    GetSearchedItemsEvent event,
    Emitter<DiseaseHistoryState> emit,
  ) async {
    final String search = event.searchedItem.length >= 3 ? event.searchedItem : '';
    if (search != state.searchText) {
      if (search.isEmpty) {
        emit(
          state.copyWith(
            searchedAppoints: [],
            searchedCategory: [],
            searchedDoctors: [],
            searchText: '',
            searchStatus: SearchStatus.initial,
          ),
        );
      } else {
        emit(state.copyWith(
          searchStatus: SearchStatus.loading,
          searchText: search,
        ));
        await Future.wait([
          _searchCategory(search, emit),
          _searchDoctor(search, emit),
          _searchAppoints(search, emit),
        ]);
        if (search == state.searchText) {
          emit(state.copyWith(searchStatus: SearchStatus.success));
        }
      }
    }
  }

  /// ---------------------------------------------------------

  Future<void> _getMedicineNames(final List<String> naznachenieIds, final Emitter<DiseaseHistoryState> emit,
      {final bool isForAdd = false}) async {
    final response = await homeRepository.getMedicineTaking(
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
          if (data.guid != null) {
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
          medicalHistoryDrugNames: isForAdd ? {...names, ...state.medicalHistoryDrugNames} : names,
          medicalHistoryDrugs: isForAdd ? {...drugs, ...state.medicalHistoryDrugs} : drugs,
        ));
      },
    );
  }

  Future<void> _getMedicationTimes(final List<String> naznachenieIds, final Emitter<DiseaseHistoryState> emit,
      {final bool isForAdd = false}) async {
    final response = await homeRepository.getMedication(
      {
        'data': {
          'naznachenie_id': naznachenieIds,
          'time_take': {
            '\$gte': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).toIso8601String(),
            '\$lt':
                DateTime.now().copyWith(hour: 0, minute: 0, second: 0).add(const Duration(days: 1)).toIso8601String(),
          }
        }
      },
    );
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

  Future<void> _searchAppoints(final String search, final Emitter<DiseaseHistoryState> emit) async {
    final response = await searchRepository.getSearchedAppointments(GetSearchedRequest(
      data: {'ill_name': search, 'limit': 5, 'offset': 0, 'cleints_id': localSource.userId},
    ));
    if (search == state.searchText) {
      emit(state.copyWith(
        searchedAppoints: response.fold<List<SearchAppointResponse>>(
          (error) => [],
          (r) => r,
        ),
      ));
    }
  }

  Future<void> _searchDoctor(final String search, final Emitter<DiseaseHistoryState> emit) async {
    final response = await searchRepository.getSearchedDoctors(GetSearchedRequest(
      data: {'doctor_name': search, 'limit': 5, 'offset': 0, 'cleints_id': localSource.userId},
    ));
    if (search == state.searchText) {
      emit(state.copyWith(
        searchedDoctors: response.fold<List<DoctorIdData>>(
          (error) => [],
          (r) => r,
        ),
      ));
    }
  }

  Future<void> _searchCategory(
    final String search,
    final Emitter<DiseaseHistoryState> emit,
  ) async {
    final List<List<DoctorTypeModel>> result = await Future.wait<List<DoctorTypeModel>>([
      _searchCategoryByLang(search, emit),
      _searchCategoryByLang(search, emit, isSearchByUz: true),
    ]);
    final Map<String, DoctorTypeModel> searchList = {};
    for (final list in result) {
      for (final DoctorTypeModel data in list) {
        searchList[data.guid ?? ''] = data;
      }
    }
    if (search == state.searchText) {
      emit(state.copyWith(searchedCategory: searchList.values.take(5).toList()));
    }
  }

  Future<List<DoctorTypeModel>> _searchCategoryByLang(
    final String search,
    final Emitter<DiseaseHistoryState> emit, {
    final bool isSearchByUz = false,
  }) async {
    final response = await searchRepository.getSearchedCategories(
      GetSearchedRequest(
        data: {
          'search': search,
          'category_name${isSearchByUz ? '_uz' : ''}': search,
          'limit': 20,
          'offset': 1,
          'cleints_id': localSource.userId,
          'view_fields': ['category_name', 'category_name_uz', 'description', 'description_uz'],
        },
      ),
    );
    return response.fold<List<DoctorTypeModel>>(
      (error) => [],
      (r) => r,
    );
  }
}

enum SearchStatus { initial, loading, success, error }
