import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/bloc/login_events.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final controller = TextEditingController(text: "hello");

  String username = '';
  String passoword = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          // keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'User Name',
          ),
          onChanged: (value) {
            username = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          // controller: controller,
          // keyboardType: TextInputType.number,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            passoword = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown
                ),
                onPressed: dispatchConcrete,
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ),
          ]
        ),
      ],
    );
  }

  void dispatchConcrete() {
    LoginAction action = LoginAction(user: username, password: passoword); 

    context.read<LoginBloc>().add(action);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Authentication Failure'),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 235, 49, 49)
        ),
      );

    controller.clear();
  }
}
