import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  String inputStr = '';

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation example'),
      ),
      body: Center(
        child:
          FlatButton(
            child: const Text('View Details'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/login',
              );
            },
          ),
      ),
    );
  }
}