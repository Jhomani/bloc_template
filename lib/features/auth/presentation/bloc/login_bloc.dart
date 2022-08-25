import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/data/models/login_.dart';
import 'package:template/features/auth/domain/usecases/login_user.dart';
import 'package:template/features/auth/presentation/bloc/login_state.dart';

import 'dart:developer' as devtools;

import 'login_events.dart';

class LoginBloc extends Bloc<AuthAction, LoginState> {
  LoginUserCase login;

  LoginBloc({
    required this.login
  }) : super(LoginState()) {
    on<LoginAction>(_initialLoginRequest);
  }

  void _initialLoginRequest(
    LoginAction event,
    Emitter<LoginState> emit,
  ) async {
    LoginModel credentials = LoginModel(
      password: event.password,
      user: event.user
    );

    var tokemModel = await login(credentials);

    devtools.log(tokemModel?.token ?? "");

    emit(AuthError(message: "You are bad guy!!!"));
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);

    devtools.log(change.nextState.toString());
  }
}
