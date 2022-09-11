part of 'login_bloc.dart';

abstract class LoginState { }

class Authenticated extends LoginState {}

class Unauthenticated extends LoginState {}

class Loading extends LoginState {
  bool active = false;

  Loading(this.active);
}

class AuthError extends LoginState {
  final String message;

  AuthError(this.message);
}