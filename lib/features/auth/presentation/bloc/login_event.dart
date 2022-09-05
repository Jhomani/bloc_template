part of 'login_bloc.dart';

abstract class LoginEvent { }

class SignInRequested extends LoginEvent {
  CredentialModel loginParams;

  SignInRequested(this.loginParams);
}