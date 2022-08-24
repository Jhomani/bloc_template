import 'package:flutter/material.dart';
import 'routes/interface.dart';

// @TODO: https://bloclibrary.dev/#/flutterlogintutorial

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation example',
      onGenerateRoute: routesGenerator,
    );
  }
}
