import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/utils/app_setting_util.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/widget/login_container.dart';
import 'package:template/layouts/auth.layout.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key}) {
    updateStatusBar(color: const Color(0x00000000));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<LoginBloc>(),
      child: const AuthLayout(
        child: LoginContainer()
      ),
  );
  } 
}
