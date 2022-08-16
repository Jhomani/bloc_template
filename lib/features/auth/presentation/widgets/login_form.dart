import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final controller = TextEditingController();
  String inputStr = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).colorScheme.secondary,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
                child: const Text('Search'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
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
    controller.clear();
    // BlocProvider.of<NumberTriviaBloc>(context)
    //     .add(GetTriviaForConcreteNumber(inputStr));
  }
}
