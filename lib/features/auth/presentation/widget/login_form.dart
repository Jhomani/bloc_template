import 'package:flutter/material.dart';
import 'package:template/core/widgets/grid/sw_column.dart';
import 'package:template/core/widgets/input/text_input_widget.dart';

class LoginForm extends StatelessWidget {
  final BuildContext blocContext;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key, required this.blocContext});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SwColumn(
          gap: 15,
          children: [
            SwTextField(
              name: 'Enter your email',
              placeholder: 'mail.example.com',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            SwTextField(
              keyboardType: TextInputType.emailAddress,
              name: 'Enter your password',
              placeholder: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
              child: const Text("Ingresar")
            ),
          ],
        )
    );
  }

  // void _doLogin() {
    // navigatorKey.currentState?.pushNamed('/');
    // blocContext.read<LoginBloc>().add(
    //   SignInRequested(
    //     CredentialModel(
    //       email: _emailController.text,
    //       password: _passwordController.text
    //     )
    //   )
    // );
  // }
}
