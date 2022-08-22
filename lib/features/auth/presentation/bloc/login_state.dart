import '../../data/models/login_.dart';

class LoginState {
  final LoginModel login;

  LoginState({
    required this.login,
  });

  @override
  String toString() => '[Login]: $login';
}