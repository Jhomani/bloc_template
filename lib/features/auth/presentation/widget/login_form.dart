import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/data/models/credentials_model.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/main.dart';

class LoginForm extends StatelessWidget {
  final BuildContext blocContext;
  LoginForm({Key? key, required this.blocContext}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: "Email"
              ),
              validator: (value){
                // TODO: IMPLEMENT EMAIL VALIDATOR
              },
            ),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",

              ),
              validator: (value){
                // TODO: IMPLEMENT PASSWORD VALIDATOR
              },
            ),

            ElevatedButton(
              onPressed: () => _doLogin(),
              child: const Text("Ingresar")
            )
          ],
        )
    );
  }

  void _doLogin(){

    navigatorKey.currentState?.pushNamed('/');
    // blocContext.read<LoginBloc>().add(
    //   SignInRequested(
    //     CredentialModel(
    //       email: _emailController.text,
    //       password: _passwordController.text
    //     )
    //   )
    // );
  }
}