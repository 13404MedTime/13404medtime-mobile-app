import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/mixin/cache_mixin.dart';
import '../../../../../core/services/notification_service.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../data/models/profile/profile_edit_request.dart';
import '../../../../../domain/repositories/profile/profile_repository.dart';

part 'profile_edit_bloc.freezed.dart';
part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> with CacheMixin {
  ProfileEditBloc(this.profileRepository) : super(const ProfileEditState()) {
    on<FirstNameChangedEvent>(_onFullNameChangedEvent);
    on<LastNameChangedEvent>(_onLastNameChangedEvent);
    on<AddressChangedEvent>(_onAddressChangedEvent);
    on<PassportNumberChangedEvent>(_onPassportNumberChangedEvent);
    on<BloodGroupChangedEvent>(_onBloodGroupChangedEvent);
    on<UserProfileEditEvent>(_onUserUpdateProfile);
    on<DeleteProfileEvent>(_onDeleteProfile);
    on<UpdateUserLang>(_updateUserLang);
    on<PassportNumberChangeEvent>(_passportNumberChange);
  }

  final ProfileRepository profileRepository;

  Future<void> _updateUserLang(
    UpdateUserLang event,
    Emitter<ProfileEditState> emit,
  ) async {
    final result = await profileRepository.updateUserLang(
      request: {
        'data': {'user_lang': localSource.locale, 'guid': localSource.userId}
      },
    );
    result.fold(
      (left) {},
      (right) {
        debugPrint('userLangUpdated');
      },
    );
  }

  void _onFullNameChangedEvent(FirstNameChangedEvent event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(showNameError: false));
  }

  void _onLastNameChangedEvent(LastNameChangedEvent event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(showSurnameError: false));
  }

  void _onAddressChangedEvent(AddressChangedEvent event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(showAddressError: false));
  }

  void _onPassportNumberChangedEvent(PassportNumberChangedEvent event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(isValidPassportNumber: false));
  }

  void _onBloodGroupChangedEvent(BloodGroupChangedEvent event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(showBloodGroupError: false));
  }

  bool _areRequiredFieldValidated(UserProfileEditEvent event, Emitter<ProfileEditState> emit) {
    bool firstNameIsEmpty = false;
    bool lastNameIsEmpty = false;
    bool addressIsEmpty = false;
    bool bloodGroupIsEmpty = false;
    if (event.firstName.isEmpty) {
      firstNameIsEmpty = true;
    }
    if (event.lastName.isEmpty) {
      lastNameIsEmpty = true;
    }
    if (event.address.isEmpty) {
      addressIsEmpty = true;
    }
    if (event.bloodGroup.isEmpty) {
      bloodGroupIsEmpty = true;
    }
    emit(state.copyWith(
      showNameError: firstNameIsEmpty,
      showAddressError: addressIsEmpty,
      showSurnameError: lastNameIsEmpty,
      showBloodGroupError: bloodGroupIsEmpty,
    ));
    if (firstNameIsEmpty || lastNameIsEmpty || addressIsEmpty || bloodGroupIsEmpty) {
      return false;
    }
    return true;
  }

  Future<void> _onUserUpdateProfile(UserProfileEditEvent event, Emitter<ProfileEditState> emit) async {
    if (!_areRequiredFieldValidated(event, emit)) {
      return;
    }
    await _isValidPassportNumber(event.passportNumber, emit);
    if (!state.isValidPassportNumber) {
      emit(state.copyWith(status: ProfileEditStatus.loading));
      final result = await profileRepository.updateProfile(
        request: ProfileEditRequest(
          clientName: event.firstName,
          cleintLastname: event.lastName,
          adres: event.address,
          pasport: event.passportNumber,
          bloodGroup: event.bloodGroup,
          phoneNumber: localSource.phoneNumber,
          cleintLang: localSource.locale,
          guid: localSource.userId,
          fcmToken: localSource.accessToken,
          birthDate: event.dateOfBirth,
          telegramNick: event.telegramNicName,
        ),
      );
      await result.fold(
        (left) {
          emit(state.copyWith(status: ProfileEditStatus.error));
        },
        (r) async {
          await setUserInfo(
            printId: '4',
            firstName: event.firstName,
            lastName: event.lastName,
            address: event.address,
            passportNumber: event.passportNumber,
            bloodGroup: event.bloodGroup,
            dateOfBirht: event.dateOfBirth.isNotEmpty ? event.dateOfBirth : null,
            telegramNick: event.telegramNicName,
          );

          if (event.dateOfBirth.isNotEmpty) {
            await cancelNotificationById(birthNotifKey);
            final dateBirth = DateTime.parse(event.dateOfBirth.replaceAll('Z', ''));
            final now = DateTime.now();
            try {
              await scheduleNotification(
                id: birthNotifKey,
                title: getBirthText().keys.first,
                body: getBirthText().values.first,
                scheduledNotificationDateTime: DateTime(
                  now.year + (dateBirth.copyWith(year: now.year).difference(now).inDays <= 0 ? 1 : 0),
                  dateBirth.month,
                  dateBirth.day,
                  8,
                ),
              );
            } on Exception catch (e) {
              debugPrint('e: $e');
            }
          }
          emit(
            state.copyWith(
              status: ProfileEditStatus.success,
              isProfileUpdated: true,
            ),
          );
        },
      );
    }
  }

  Future<void> _onDeleteProfile(
    DeleteProfileEvent event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(status: ProfileEditStatus.loading));
    final userDelete = await profileRepository.deleteUser();

    await userDelete.fold(
      (left) {
        emit(state.copyWith(status: ProfileEditStatus.error));
      },
      (r) async {
        final clientDelete = await profileRepository.deleteClient();
        await clientDelete.fold(
          (left) {
            emit(state.copyWith(status: ProfileEditStatus.error));
          },
          (right) async {
            await localSource.clearProfile();
            await localSource.deleteTelegramUserName();
            cancelAllNotifications();
            await sendAnalyticsEvent(
              tag: FirebaseAnalyticsEvents.deleteAccountBtn,
              parameters: {'user_name': localSource.firstName},
            );
            emit(
              state.copyWith(
                status: ProfileEditStatus.success,
                isProfileDeleted: true,
              ),
            );
          },
        );
      },
    );
  }

  void _passportNumberChange(
    PassportNumberChangeEvent event,
    Emitter<ProfileEditState> emit,
  ) {
    emit(state.copyWith(passportNumber: event.passportNumber));
  }

  Future<void> _isValidPassportNumber(
    String passportId,
    Emitter<ProfileEditState> emit,
  ) async {
    final RegExp regex = RegExp(r'^[A-Z]{2} [0-9]{7}$');
    if (passportId.isEmpty) {
      emit(state.copyWith(isValidPassportNumber: false));
    } else if (regex.hasMatch(passportId)) {
      emit(state.copyWith(isValidPassportNumber: false));
    } else {
      emit(state.copyWith(isValidPassportNumber: true));
    }
    // if (state.passportNumber.isEmpty) {
    //   emit(
    //     state.copyWith(
    //       isValidPassportNumber: false,
    //     ),
    //   );
    // }
    // if (state.passportNumber.length == 10) {
    //   if (regex.hasMatch(state.passportNumber)) {
    //     emit(
    //       state.copyWith(
    //         isValidPassportNumber: false,
    //       ),
    //     );
    //   } else {
    //     emit(
    //       state.copyWith(
    //         isValidPassportNumber: true,
    //       ),
    //     );
    //   }
    // }
  }
}
