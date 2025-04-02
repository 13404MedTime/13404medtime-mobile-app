part of 'confirm_code_bloc.dart';

@freezed
class ConfirmCodeEvent with _$ConfirmCodeEvent {
  /// bottom
  const factory ConfirmCodeEvent.initial() = ConfirmCodeEventInitial;

  const factory ConfirmCodeEvent.phoneChanged(String value) = ConfirmCodePhoneChangeEvent;

  const factory ConfirmCodeEvent.sendAgain(String value) = ConfirmCodeSendAgainEvent;

  const factory ConfirmCodeEvent.updateFcmTokenAndPlatformType() = UpdateFcmTokenAndPlatformType;

  const factory ConfirmCodeEvent.loginWithOption({
    required String otp,
    required String smsId,
    required String phone,
    required Map data,
  }) = ConfirmCodeCheckMessageEvent;
}
