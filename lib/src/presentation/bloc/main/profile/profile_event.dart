part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.signOutFromGoogleAccount() = SignOutFromGoogleAccountEvent;

  const factory ProfileEvent.getProfile() = GetProfileEvent;

  const factory ProfileEvent.updateProfile({
    required String telegramNicName,
  }) = UserProfileEditEvent;

  const factory ProfileEvent.isDisableEvent({
    required bool isDisable,
  }) = isDisableEvent;

  const factory ProfileEvent.isVisibleItemEvent({
    required bool isVisibleItem,
  }) = isVisibleItemEvent;

  const factory ProfileEvent.getUpcomingVisits() = GetUpcomingVisitsEventProfile;
}
