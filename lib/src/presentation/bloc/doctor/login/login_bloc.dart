import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/mixin/cache_mixin.dart';
import '../../../../domain/repositories/doctor/login/doctor_login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with CacheMixin {
  LoginBloc({required this.doctorLoginRepository}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) => switch (event) {
          UsernameChanged$LoginEvent _ => _usernameChanged(event, emit),
          PasswordChanged$LoginEvent _ => _passwordChanged(event, emit),
          LoginButtonPressed$LoginEvent _ => _login(event, emit),
          ObscureTextChanged$LoginEvent _ => _obscureTextChanged(event, emit),
        });
  }

  final DoctorLoginRepository doctorLoginRepository;

  void _usernameChanged(UsernameChanged$LoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordChanged(PasswordChanged$LoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _obscureTextChanged(ObscureTextChanged$LoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  Future<void> _login(
    LoginButtonPressed$LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (state.username.isEmpty) {
      emit(state.copyWith(emptyUsername: true));
    }
    if (state.password.isEmpty) {
      emit(state.copyWith(emptyPassword: true));
    }
    if (state.username.isNotEmpty && state.password.isNotEmpty) {
      emit(state.copyWith(
        isLoading: true,
        emptyPassword: false,
        emptyUsername: false,
        errorUsername: false,
        errorPassword: false,
      ));
      final result = await doctorLoginRepository.oneLogin(
        request: {
          'username': state.username.trim(),
          'password': state.password.trim(),
        },
      );
      if (result.isRight) {
        final data = await doctorLoginRepository.doctorLogin(
          request: {
            'username': state.username.trim(),
            'password': state.password.trim(),
            'company_id': result.right.data.companies[0].id,
            'project_id': result.right.data.companies[0].projects[0].id,
            'environment_id': result.right.data.companies[0].projects[0].resourceEnvironments[0].environmentId,
            'client_type':
                result.right.data.companies[0].projects[0].resourceEnvironments[0].clientTypes.response[0].guid,
            'environment_ids':
                result.right.data.companies[0].projects[0].resourceEnvironments.map((e) => e.id).toList(),
            'currencies': result.right.data.companies[0].projects[0].currencies
          },
        );
        if (data.isRight) {
          await data.fold(
            (left) {
              emit(state.copyWith(errorUsername: true, errorPassword: true));
            },
            (r) async {
              await setUserInfo(
                printId: '2',
                firstName: r.name,
                password: state.password,
                lastName: 'admin-doctor',
                id: r.id,
                login: state.username,
                email: '',
                phoneNumber: r.phone,
                accessToken: r.accessToken,
                refreshToken: r.refreshToken,
                imageUrl: r.imageUrl,
                address: r.address,
                telegramNick: r.telegramNick,
              );
            },
          );
        }
        emit(state.copyWith(errorUsername: false, errorPassword: false));
        if (event.context.mounted) {
          await Navigator.pushNamedAndRemoveUntil(
            event.context,
            Routes.doctorMain,
            (route) => false,
          );
        }
      } else {
        emit(state.copyWith(errorUsername: true, errorPassword: true, isLoading: false));
      }
    } else {
      emit(state.copyWith(errorUsername: true, errorPassword: true, isLoading: false));
    }
  }
}
