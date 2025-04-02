part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = HomeEventInitial;

  const factory HomeEvent.getSubscriptionStatusOfUserEvent() = GetSubscriptionStatusOfUserEvent;

  const factory HomeEvent.getFavouriteDoctors() = GetFavouriteDoctorsEvent;

  const factory HomeEvent.getAppointments() = GetAppointmentsEvent;

  const factory HomeEvent.getAppointmentsForSave() = GetAppointmentsForSaveEvent;

  const factory HomeEvent.getVisits() = GetVisitsEvent;

  const factory HomeEvent.getMedicalHistory() = GetMedicalHistoryEvent;

  const factory HomeEvent.getUnreadNotificationsCount() = GetUnreadNotificationsCount;

  const factory HomeEvent.onChangeIsLoading({
    @Default(false) bool isLoading,
  }) = OnChangeIsLoading;

  const factory HomeEvent.getAnalysisSurvey() = GetAnalysisSurveyHomeEvent;

  const factory HomeEvent.updateCurrentAppointmentsCount({
    required int value,
  }) = UpdateCurrentAppointmentsCount;

  const factory HomeEvent.getAverageDistanceHeartEvent() = GetAverageDistanceHeartEvent;

  const factory HomeEvent.getBestDistanceAndTimeEvent() = GetBestDistanceAndTimeEvent;

  const factory HomeEvent.logoutAccount() = LogoutAccountEvent;

  const factory HomeEvent.getUpcomingVisits() = GetUpcomingVisitsEvent;
}
