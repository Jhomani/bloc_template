import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/domain/usecases/login_user.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(login: LoginUserCase()),
      child:  Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: const LoginForm(),
      )
    );
  }
}

