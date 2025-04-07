part of 'health_bloc.dart';

@freezed
class HealthState with _$HealthState {
  const factory HealthState({
    @Default([]) List<PedometerModel> pedometerList,
    @Default([]) List<ArterialPressureModel> arterialPressureList,
    @Default([]) List<BloodSugarModel> bloodSugarList,
    @Default([]) List<TWHModel> twhList,
    @Default(0) int stepsCount,
    @Default(0) int hours,
    @Default(0) int minutes,
    @Default(0) int distance,
    // @Default(DateTime) DateTime duration,
    @Default(false) bool isLoading,
    @Default(false) bool pedometerLoading,
    @Default(false) bool arterialPressureLoading,
    @Default(false) bool bloodSugarLoading,
    @Default(false) bool twhLoading,
    @Default(false) bool isUpdatedPedometer,
    @Default(false) bool isUpdatedArterialPressure,
    @Default(false) bool remindMeGivePermissionAppleHealth,
    @Default(false) bool remindMeGoogleFitInstallationLater,
    @Default(false) bool remindMeGoogleFitRegistrationLater,
    @Default(false) bool showGoogleFitRegistrationDialog,
  }) = _HealthState;
}
