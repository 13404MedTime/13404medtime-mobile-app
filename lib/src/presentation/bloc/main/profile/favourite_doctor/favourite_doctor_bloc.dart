import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../../domain/repositories/profile/profile_repository.dart';

part 'favourite_doctor_bloc.freezed.dart';

part 'favourite_doctor_event.dart';

part 'favourite_doctor_state.dart';

class FavouriteDoctorBloc extends Bloc<FavouriteDoctorEvent, FavouriteDoctorState> {
  FavouriteDoctorBloc(this.profileRepository) : super(const FavouriteDoctorState()) {
    on<GetFavouriteDoctorEvent>(_getFavouriteDoctor);
  }

  final ProfileRepository profileRepository;

  Future<void> _getFavouriteDoctor(GetFavouriteDoctorEvent event, Emitter<FavouriteDoctorState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await profileRepository.getFavouriteDoctors(
      request: jsonEncode({
        'with_relations': true,
        'is_favourite': true,
        'cleints_id': localSource.userId,
      }),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false));
      },
      (result) {
        emit(
          state.copyWith(
            favouriteDoctorList: result.data?.data?.response ?? [],
            isLoading: false,
          ),
        );
      },
    );
  }
}
