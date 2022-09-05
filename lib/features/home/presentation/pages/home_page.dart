import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as devtools;

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputStr = '';
  FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();


    node.addListener(() {
      devtools.log("Hellos world");
    });
  }

  @override
  void dispose() {

    node.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));

    return Stack(
      children: [
      Scaffold(
        appBar: AppBar(
          title: const Text('Navigation example'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            children: [
              // The first text field is focused on as soon as the app starts.
              // The second text field is focused on when a user taps the
              // FloatingActionButton.
              TextField(
                focusNode: node,
              ),
              TextButton(
                // focusNode: node,
                onPressed: () { devtools.log("Button Pressed");},
                child: Text("Hello Word"),
              )
            ],
          ),
        )
      ),
      // ClipRRect( // Clip it cleanly. 
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      //     child: Container(
      //       color: Colors.grey.withOpacity(0.1),
      //       alignment: Alignment.center,
      //       child: Text('CHOCOLATE'),
      //     ),
      //   ),
      // ),
      ]
    );
  }
}