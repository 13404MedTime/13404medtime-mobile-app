class LoginWithOptionRequest {
  LoginWithOptionRequest({
    required this.data,
    required this.loginStrategy,
    this.tables = const [],
  });

  final Map data;
  final String loginStrategy;
  final List tables;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['login_strategy'] = loginStrategy;
    data['tables'] = tables;
    return data;
  }
}
