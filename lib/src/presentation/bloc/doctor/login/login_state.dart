part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.errorPassword = false,
    this.errorUsername = false,
    this.emptyUsername = false,
    this.emptyPassword = false,
    this.username = '',
    this.password = '',
    this.obscureText = true,
  });

  final bool isLoading;
  final bool errorUsername;
  final bool errorPassword;
  final bool emptyUsername;
  final bool emptyPassword;
  final String username;
  final String password;
  final bool obscureText;

  @override
  List<Object?> get props => [
        isLoading,
        errorUsername,
        errorPassword,
        emptyUsername,
        emptyPassword,
        username,
        password,
        obscureText,
      ];

  LoginState copyWith({
    final bool? isLoading,
    final bool? errorPassword,
    final bool? errorUsername,
    final bool? emptyUsername,
    final bool? emptyPassword,
    final String? username,
    final String? password,
    final bool? obscureText,
  }) =>
      LoginState(
        isLoading: isLoading ?? this.isLoading,
        errorPassword: errorPassword ?? this.errorPassword,
        errorUsername: errorUsername ?? this.errorUsername,
        emptyUsername: emptyUsername ?? this.emptyUsername,
        emptyPassword: emptyPassword ?? this.emptyPassword,
        username: username ?? this.username,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText,
      );
}
