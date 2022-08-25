import '../../data/models/login_.dart';

// class LoginState {
//   bool loading = false;
//   LoginModel login;
//   String? error;

//   LoginState({
//     required this.login,
//   });

//   @override
//   String toString() => '[Login]: $login';
// }

class LoginState {}

class Credencials extends LoginState{
  final LoginModel login;

  Credencials({
    required this.login,
  });
}

class AuthError extends LoginState {
  final String message;

  AuthError({
    required this.message,
  });
}

class Loading extends LoginState {
  final bool status;

  Loading({
    required this.status,
  });
}

