import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../domain/repositories/consultation/consultation_repository.dart';

part 'specialists_bloc.freezed.dart';
part 'specialists_event.dart';
part 'specialists_state.dart';

class SpecialistsBloc extends Bloc<SpecialistsEvent, SpecialistsState> {
  SpecialistsBloc(this.repository) : super(const SpecialistsState()) {
    on<SearchDoctorsEvent>(_searchDoctors);
  }

  final ConsultationRepository repository;

  Future<void> _searchDoctors(SearchDoctorsEvent event, Emitter<SpecialistsState> emit) async {
    // if (event.searchText.isEmpty) {
    //   emit(state.copyWith(
    //     doctorsTypes: [],
    //   ));
    //   return;
    // }
    if (event.searchText.isNotEmpty && event.searchText.length < 3) return;
    emit(state.copyWith(isLoading: true));
    await getDoctors(event.searchText, event.categoryGuid, emit);
  }

  Future<void> getDoctors(String searchText, String categoryGuid, Emitter<SpecialistsState> emit) async {
    final response = await repository.getDoctors(request: {
      'data': {
        'category_id': categoryGuid,
        'doctor_name': searchText,
      },
    });
    response.fold(
      (error) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(
          isLoading: false,
          doctors: r.doctorsTypes ?? [],
        ));
      },
    );
  }
}
