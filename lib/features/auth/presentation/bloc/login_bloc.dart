import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/data/models/login_.dart';
import 'package:template/features/auth/presentation/bloc/login_state.dart';

import 'dart:developer' as devtools;

import 'login_events.dart';

class LoginBloc extends Bloc<AuthAction, LoginState?> {
  bool errors = false;

  LoginBloc() : super(null) {
    on<LoginAction>(_initialLoginRequest);
  }

  void _initialLoginRequest(
    LoginAction event,
    Emitter<LoginState?> emit,
  ) {
    var login = LoginModel(
      password: event.password,
      user: event.user
    );

    // final username = Username.dirty(event.username);
    emit(LoginState(login: login));
  }

  @override
  void onChange(Change<LoginState?> change) {
    super.onChange(change);

    devtools.log(change.nextState.toString());
  }
}
