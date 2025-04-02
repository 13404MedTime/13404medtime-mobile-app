import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/mixin/cache_mixin.dart';
import '../../../../data/models/auth/send_code_request.dart';
import '../../../../data/models/auth/verify_request.dart';
import '../../../../domain/repositories/auth/auth_repository.dart';

part 'confirm_code_bloc.freezed.dart';
part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> with CacheMixin {
  ConfirmCodeBloc(this.authRepository) : super(const ConfirmCodeState()) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
    on<ConfirmCodeSendAgainEvent>(_sendAgain);
    on<UpdateFcmTokenAndPlatformType>(_updateFcmTokenAndPlatformType);
  }

  final AuthRepository authRepository;

  Future<void> _updateFcmTokenAndPlatformType(
      UpdateFcmTokenAndPlatformType event, Emitter<ConfirmCodeState> emit) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final isIOS = Platform.isIOS;
    final result = await authRepository.updateFcmTokenAndPlatformType(
      request: {
        'data': {
          'fcm_token': fcmToken,
          'platform': isIOS ? 0 : 1,
          'user_lang': localSource.locale,
          'guid': localSource.userId
        }
      },
    );
    result.fold(
      (l) {
        emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.error));
      },
      (r) {
        emit(
          state.copyWith(
            confirmCodeStatus: ConfirmCodeStatus.confirimed,
            shouldUpdateFcmTokenAndPlatformType: false,
          ),
        );
      },
    );
  }

  Future<void> _sendAgain(ConfirmCodeSendAgainEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.loading));
    final result = await authRepository.sendCode(
      request: SendCodeRequest(
        recipient: event.value,
        text: 'code',
        type: 'PHONE',
      ),
    );
    result.fold(
      (l) {
        emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.error));
      },
      (r) {
        emit(
          state.copyWith(
            confirmCodeStatus: ConfirmCodeStatus.success,
            smsId: r.data?['sms_id'],
            data: r.data ?? {},
            isReverseSendCode: true,
          ),
        );
      },
    );
  }

  Future<void> _onConfirmCode(ConfirmCodeCheckMessageEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.loading));
    final result = await authRepository.loginWithOption(
      request: LoginWithOptionRequest(
        loginStrategy: 'PHONE_OTP',
        data: {
          'sms_id': event.smsId,
          'phone': event.phone,
          'role_id': Constants.roleId,
          'otp': event.otp,
          'client_type_id': Constants.clientTypeId,
        },
      ),
    );
    await result.fold(
      (l) {
        emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.error));
      },
      (r) async {
        if (r.data?.isNotEmpty ?? false) {
          await setUserInfo(
            printId: '1',
            // name: r.data?['user']['name'] ?? '',
            // password: r.data?['user']['password'] ?? '',
            id: r.data?['user_id'],
            passportNumber: r.data?['user_data']?['pasport'],
            // login: r.data?['user']['login'],
            // email: r.data?['user']['email'],
            // phoneNumber: r.data?['user']['phone'],
            accessToken: r.data?['token']['access_token'],
            refreshToken: r.data?['token']['refresh_token'],
            imageUrl: '',
          );
        }
        emit(
          state.copyWith(
            isUserFound: r.message != 'Пользователь проверен, но не найден',
            shouldUpdateFcmTokenAndPlatformType: r.message != 'Пользователь проверен, но не найден',
            confirmCodeStatus: ConfirmCodeStatus.confirimed,
          ),
        );
      },
    );
  }
}
