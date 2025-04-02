part of 'profile_edit_bloc.dart';

@freezed
class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.started() = _Started;

  const factory ProfileEditEvent.updateProfile({
    required String firstName,
    required String lastName,
    required String address,
    required String passportNumber,
    required String bloodGroup,
    required String dateOfBirth,
    required String telegramNicName,
  }) = UserProfileEditEvent;

  const factory ProfileEditEvent.onFirstNameChanged() = FirstNameChangedEvent;
  const factory ProfileEditEvent.onLastNameChanged() = LastNameChangedEvent;
  const factory ProfileEditEvent.onAddressChanged() = AddressChangedEvent;
  const factory ProfileEditEvent.onPassportNumberChanged() = PassportNumberChangedEvent;
  const factory ProfileEditEvent.onBloodGroupChanged() = BloodGroupChangedEvent;
  const factory ProfileEditEvent.deleteProfile() = DeleteProfileEvent;
  const factory ProfileEditEvent.updateUserLang({
    @Default('') String userLang,
  }) = UpdateUserLang;
  const factory ProfileEditEvent.passportNumberChangeEvent({
    @Default('') String passportNumber,
  }) = PassportNumberChangeEvent;
}
