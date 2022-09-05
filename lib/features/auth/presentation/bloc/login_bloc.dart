import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/network/http_errors.dart';
import 'package:template/features/auth/data/models/credentials_model.dart';
import 'dart:developer' as devtools;

import 'package:template/features/auth/domain/usecases/login_usecase.dart';
import 'package:template/main.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase doSignInUseCase;
  
  LoginBloc({
    required this.doSignInUseCase
  }) : super(Loading(false)) {
    on<SignInRequested>(_handleLoginUser);
  }
  
  Future<void> _handleLoginUser(
    SignInRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(Loading(true));

    try{
      await doSignInUseCase(CredentialModel(
        password: event.loginParams.email,
        email: event.loginParams.password
      ));

      await navigatorKey.currentState?.pushReplacementNamed('/home');
    } on Unauthorized {
      emit(AuthError("Credenciales Incorrectas."));
    } on EntityNotFound {
      emit(AuthError("Credenciales Incorrectas."));
    } catch(error) {
      devtools.log(error.toString());
    } finally {
      emit(Loading(false));
    }
  }
}