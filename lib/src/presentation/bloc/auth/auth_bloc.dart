import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/auth/send_code_request.dart';
import '../../../domain/repositories/auth/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthState()) {
    on<AuthPhoneChangeEvent>(_onChanged);
    on<AuthCheckMessageEvent>(_onSendMessage);
  }

  final AuthRepository authRepository;

  void _onChanged(AuthPhoneChangeEvent event, Emitter<AuthState> emit) {
    if (event.value.trim().replaceAll(' ', '').length <= 8) {
      emit(const AuthState());
      return;
    }
    emit(AuthPhoneState(event.value));
  }

  Future<void> _onSendMessage(AuthCheckMessageEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await authRepository.sendCode(
      request: SendCodeRequest(
        recipient: "+998${event.phone.replaceAll(" ", "")}",
        text: 'code',
        type: 'PHONE',
      ),
    );
    result.fold(
      (l) {
        emit(const AuthState.error());
      },
      (r) {
        emit(
          AuthState.success(
            r.data?['sms_id'],
            "+998${event.phone.replaceAll(" ", "")}",
            event.phone,
            r.data ?? {},
          ),
        );
      },
    );
  }
}
