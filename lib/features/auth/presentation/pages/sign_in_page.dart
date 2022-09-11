import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/widget/login_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key : key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}


class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
            create: (context) => GetIt.instance<LoginBloc>(),
            child: BlocListener<LoginBloc, LoginState>(
              listenWhen: (_, state) => state is AuthError,
              listener: (context, state){
                var error  = state as AuthError;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.message))
                );
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (_, state) => state is Loading,
                builder: (BuildContext context, state) {
                  var loading = state as Loading;

                  Widget stateView = const SizedBox();
                  if(loading.active) {
                    stateView = Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white)
                      ),
                    );
                  }

                  return Stack(
                    children: [
                      LoginForm(blocContext: context),
                      stateView
                    ],
                  );
                },
              ),
            )
        )
      ),
    );
  }
}