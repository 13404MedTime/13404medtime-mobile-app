part of 'health_bloc.dart';

@freezed
class HealthEvent with _$HealthEvent {
  const factory HealthEvent.getStepsCountOfToday() = GetStepsCountOfTodayEvent;

  const factory HealthEvent.getStepsCount3Day() = GetStepsCountOf3DayEvent;

  const factory HealthEvent.getGoogleFitInstallationStatus() = GetGoogleFitInstallationStatusEvent;

  const factory HealthEvent.pushPlayMarketForInstallGoogleFit({
    required BuildContext context,
    required bool isFromDialog,
  }) = PushPlayMarketForInstallGoogleFitEvent;

  const factory HealthEvent.pushGoogleFitForRegistration() = PushGoogleFitForRegistrationEvent;

  const factory HealthEvent.googleFitInstallation({required bool later}) = GoogleFitInstallationEvent;

  const factory HealthEvent.googleFitRegistration({required bool later}) = GoogleFitRegistrationEvent;

  const factory HealthEvent.getHealthInfo() = GetHealthInfoEvent;

  const factory HealthEvent.googleSignOut() = GoogleSignOutEvent;

  const factory HealthEvent.getPedometer() = GetPedometerEvent;

  const factory HealthEvent.getArterialPressure() = GetArterialPressureEvent;

  const factory HealthEvent.getBloodSugar() = GetBloodSugarEvent;

  const factory HealthEvent.getTWH() = GetTWHEvent;

  const factory HealthEvent.updatedPedometerIsUpdated({required bool isUpdate}) = UpdatedPedometerIsUpdatedEvent;

  const factory HealthEvent.updatedrterialPressureIsUpdated({required bool isUpdate}) =
      UpdatedArterialPressureIsUpdatedEvent;

  const factory HealthEvent.addSubHealth({
    @Default({}) request,
    required SubHealthType type,
  }) = AddSubHealthEvent;
}
