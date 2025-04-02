part of 'confirm_code_bloc.dart';

@freezed
class ConfirmCodeState with _$ConfirmCodeState {
  const factory ConfirmCodeState({
    @Default('') String smsId,
    @Default(false) bool isReverseSendCode,
    @Default(false) bool isUserFound,
    @Default(false) bool shouldUpdateFcmTokenAndPlatformType,
    @Default({}) Map data,
    @Default(ConfirmCodeStatus.initial) ConfirmCodeStatus confirmCodeStatus,
  }) = _ConfirmCodeState;
}

enum ConfirmCodeStatus { initial, loading, success, error, confirimed }
