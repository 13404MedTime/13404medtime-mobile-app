import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../data/models/consultation/doctors_types_response.dart';
import '../../../domain/repositories/consultation/consultation_repository.dart';

part 'consultation_bloc.freezed.dart';
part 'consultation_event.dart';
part 'consultation_state.dart';

class ConsultationBloc extends Bloc<ConsultationEvent, ConsultationState> {
  ConsultationBloc(this.repository) : super(const ConsultationState()) {
    on<SearchDoctorsTypesEvent>(_searchDoctorsTypes);
  }

  final ConsultationRepository repository;

  Future<void> _searchDoctorsTypes(SearchDoctorsTypesEvent event, Emitter<ConsultationState> emit) async {
    // if (event.searchText.isEmpty) {
    //   emit(state.copyWith(
    //     doctorsTypes: [],
    //   ));
    //   return;
    // }
    if (event.searchText.isNotEmpty && event.searchText.length < 3) return;
    await getDoctorsTypes(event.searchText, emit);
  }

  Future<void> getDoctorsTypes(String searchText, Emitter<ConsultationState> emit) async {
    final String categoryName = 'category_name${localSource.locale != 'ru' ? '_uz' : ''}';
    final response = await repository.getDoctorsTypes(request: {
      'data': {categoryName: searchText}
    });
    response.fold(
      (error) {},
      (r) {
        emit(state.copyWith(
          doctorsTypes: r.doctorsTypes ?? [],
        ));
      },
    );
  }
}
