import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/widgets/button/btn_primary.dart';
import 'package:template/core/widgets/grid/sw_column.dart';
import 'package:template/core/widgets/input/text_input_widget.dart';

import '../../data/models/credentials_model.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key});

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
            SwButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/home');
                _showBottomModal(context);
                // _showMyDialog(context);
              },
              text: "Ingresar"
            ),
          ],
        )
    );
  }
  
  void _showBottomModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // isDismissible: true, // user must tab button!
      isScrollControlled: true,
      builder: (context) => 
        Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text("some info") ,
        )
      );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('AlertDialog Title'),
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListBody(
                children: const <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('Approve'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  void _doLogin(BuildContext context) {
    Navigator.of(context).pushNamed('/');
    
    context.read<LoginBloc>().add(
      SignInRequested(
        CredentialModel(
          email: _emailController.text,
          password: _passwordController.text
        )
      )
    );
  }
}
