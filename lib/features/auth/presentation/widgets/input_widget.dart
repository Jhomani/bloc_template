import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_state.dart';

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => BlocBuilder<LoginBloc, LoginState?>(
      buildWhen: (previous, current) => previous?.login != current?.login,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          // onChanged: (username) =>
          //   context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'username',
            // errorText: state.username.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
}
