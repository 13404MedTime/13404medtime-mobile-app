part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

final class UsernameChanged$LoginEvent extends LoginEvent {
  const UsernameChanged$LoginEvent({required this.username});

  final String username;
}

final class PasswordChanged$LoginEvent extends LoginEvent {
  const PasswordChanged$LoginEvent({required this.password});

  final String password;
}

final class LoginButtonPressed$LoginEvent extends LoginEvent {
  const LoginButtonPressed$LoginEvent(this.context);

  final BuildContext context;
}

final class ObscureTextChanged$LoginEvent extends LoginEvent {
  const ObscureTextChanged$LoginEvent();
}
