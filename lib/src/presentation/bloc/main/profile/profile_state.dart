part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isDisable,
    @Default(false) bool isLoading,
    @Default(false) bool hasGoogleAccount,
    @Default(true) bool isVisibleItem,
    @Default(0) int upcomingVisits,
  }) = _ProfileState;
}
