part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) int averageStepsCount,
    @Default(0) int currentAppointmentsCount,
    @Default(false) bool subscriptionStatusLoading,
    @Default(false) bool isLoading,
    @Default(true) bool emptyPage,
    @Default([]) List<MyAppointModel> myAppointments,
    @Default([]) List<MyVisitModel> myVisits,
    @Default(0) int medicalHistoryCount,
    @Default([]) List<NaznachenieIdData> medicalHistory,
    @Default({}) Map<String, List<String>> medicalHistoryDrugNames,
    @Default({}) Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes,
    @Default({}) Map<String, MedicineTakingModel> medicalHistoryDrugs,
    @Default(SwitchModel()) SwitchModel switchData,
    @Default({}) Map statisticsAndTopPerformance,
    @Default(0) num avarageHeart,
    @Default(0) num avarageDistance,
    @Default(0) num bestDistance,
    @Default(0) num bestTime,
    @Default(0) int analysisCount,
    @Default(false) bool isAppointmentsLoading,
    @Default(false) bool isVisitsLoading,
    @Default(false) bool isMedicalHistoryLoading,
    @Default(false) bool isStatisticsLoading,
    @Default(false) bool isAnalysisSurveyLoading,
    @Default(0) int unreadNotificationsCount,
    @Default([]) List<DoctorBooking> upcomingVisits,
    @Default(false) bool isUpcomingVisitsLoading,
  }) = _HomeState;
}
