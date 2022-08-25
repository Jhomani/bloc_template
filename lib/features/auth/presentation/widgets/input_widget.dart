import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_state.dart';
import 'dart:developer' as devtools;

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => BlocListener<LoginBloc, LoginState>(
      listenWhen: (prev, state) => state is AuthError,
      listener: (context, state) {
        AuthError err = state as AuthError;

        devtools.log(err.message);
      },
      child: const TextField(
        key: Key('loginForm_usernameInput_textField'),
        // onChanged: (username) =>
        //   context.read<LoginBloc>().add(LoginUsernameChanged(username)),
        decoration: InputDecoration(
          labelText: 'username',
        ),
      )
    );
}
