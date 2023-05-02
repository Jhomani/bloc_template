import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/widget/login_form.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key : key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context){
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, next) => next is Loading,
      builder: (context, state) {
        return LoginForm();
      },
    );
  }
}
