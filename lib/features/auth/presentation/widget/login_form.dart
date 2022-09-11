import 'package:flutter/material.dart';
import 'package:template/core/widgets/accordion_widget.dart';
import 'package:template/core/widgets/typography.dart';
import 'package:template/main.dart';
import 'dart:developer' as devtools;

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
              validator: (value) {
                devtools.log(value.toString());
                return null;
                // @TODO: IMPLEMENT EMAIL VALIDATOR
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
                // @TODO: IMPLEMENT PASSWORD VALIDATOR
                return null;
              },
            ),

            ElevatedButton(
              onPressed: () => _doLogin(),
              child: const Text("Ingresar")
            ),
            Accordion(header: AppTypography.subTitleOne('Text this is very large text for text the accordions and to fill all the screen size'), body: const Text('debugging on your device. This varies slightly by Android version, but the short version is you tap on the Device Build Number 7 times. Then a "Developer Options" option comes up and you can click "enable USB Debugging." See the linked Android documentation for the most up-to-date instructions.')),
            Accordion(header: Text("Text this is very large text for text the accordions and to fill all the screen size"), body: Text('debugging on your device. This varies slightly by Android version, but the short version is you tap on the Device Build Number 7 times. Then a "Developer Options" option comes up and you can click "enable USB Debugging." See the linked Android documentation for the most up-to-date instructions.')),
            Accordion(header: Text("Text this is very large text for text the accordions and to fill all the screen size"), body: Text('debugging on your device. This varies slightly by Android version, but the short version is you tap on the Device Build Number 7 times. Then a "Developer Options" option comes up and you can click "enable USB Debugging." See the linked Android documentation for the most up-to-date instructions.')),
            Accordion(header: Text("Text this is very large text for text the accordions and to fill all the screen size"), body: Text('debugging on your device. This varies slightly by Android version, but the short version is you tap on the Device Build Number 7 times. Then a "Developer Options" option comes up and you can click "enable USB Debugging." See the linked Android documentation for the most up-to-date instructions.')),
            Accordion(header: Text("Text this is very large text for text the accordions and to fill all the screen size"), body: Text('debugging on your device. This varies slightly by Android version, but the short version is you tap on the Device Build Number 7 times. Then a "Developer Options" option comes up and you can click "enable USB Debugging." See the linked Android documentation for the most up-to-date instructions.')),
            DropdownButtonExample(),
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

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 2,
      style: const TextStyle(color: Colors.deepPurple),
      underline: const SizedBox.shrink(),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      dropdownColor: Colors.blue,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
