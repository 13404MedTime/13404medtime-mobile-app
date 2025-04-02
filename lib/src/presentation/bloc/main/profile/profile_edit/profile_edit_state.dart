part of 'profile_edit_bloc.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(false) bool showNameError,
    @Default(false) bool showSurnameError,
    @Default(false) bool showAddressError,
    @Default(false) bool showBloodGroupError,
    @Default(ProfileEditStatus.initial) ProfileEditStatus status,
    @Default(false) bool isProfileUpdated,
    @Default(false) bool isProfileDeleted,
    @Default(false) bool isValidPassportNumber,
    @Default('') String passportNumber,
  }) = _ProfileEditState;
}

enum ProfileEditStatus {
  initial,
  success,
  loading,
  deleted,
  error,
}
