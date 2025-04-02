import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../data/models/profile/profile_edit_request.dart';
import '../../../../domain/repositories/profile/profile_repository.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(const ProfileState()) {
    on<SignOutFromGoogleAccountEvent>(_signOutFromGoogleAccount);
    on<UserProfileEditEvent>(_onUserUpdateProfile);
    on<isDisableEvent>(_isDisableButton);
    on<isVisibleItemEvent>(_isVisibleItem);
    on<GetUpcomingVisitsEventProfile>(_onGetUpcomingVisits);
  }

  final ProfileRepository profileRepository;

  Future<void> _signOutFromGoogleAccount(
    SignOutFromGoogleAccountEvent event,
    Emitter<ProfileState> emit,
  ) async {
    // final GoogleSignIn googleSignIn = GoogleSignIn();
    // emit(state.copyWith(isLoading: true));
    // await googleSignIn.signOut();
    // await sl<LocalSource>().setRegisteredFromGoogleFitStatus(
    //   isRegisteredFromGoogleFit: false,
    // );
    // await sl<LocalSource>().setGoogleFitRegistrationRemindStatus(
    //   shouldGoogleFitRemind: true,
    // );
    //
    // emit(state.copyWith(isLoading: false));
  }

  Future<void> _onUserUpdateProfile(
    UserProfileEditEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await profileRepository.updateProfile(
      request: ProfileEditRequest(
        clientName: localSource.firstName,
        cleintLastname: localSource.lastName,
        adres: localSource.address,
        pasport: localSource.passportNumber,
        bloodGroup: localSource.bloodGroup,
        phoneNumber: localSource.phoneNumber,
        cleintLang: localSource.locale,
        guid: localSource.userId,
        fcmToken: localSource.accessToken,
        birthDate: localSource.dateOfBirth,
        telegramNick: event.telegramNicName,
      ),
    );
    result.fold(
      (left) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        localSource.setTelegramUserName(event.telegramNicName);
        emit(
          state.copyWith(
            isDisable: false,
            isVisibleItem: false,
            isLoading: false,
          ),
        );
      },
    );
  }

  Future<void> _isDisableButton(isDisableEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isDisable: event.isDisable));
  }

  Future<void> _isVisibleItem(isVisibleItemEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isVisibleItem: event.isVisibleItem));
  }

  Future<void> _onGetUpcomingVisits(GetUpcomingVisitsEventProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await profileRepository.getPatient(
      request: {
        'data': {
          'cleints_id': [localSource.userId],
          'offset': null,
          'search': '',
          'undefined': ''
        }
      },
    );
    result.fold(
      (left) {
        emit(state.copyWith(isLoading: false));
      },
      (right) {
        emit(
          state.copyWith(
            isLoading: false,
            upcomingVisits: right.data.data.response
                .where(
                  (e) => e.date.isAfter(DateTime.now()),
                )
                .length,
          ),
        );
      },
    );
  }
}
