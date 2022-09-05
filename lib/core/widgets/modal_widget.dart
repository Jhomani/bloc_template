import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools;

import 'package:flutter/services.dart';

class Modal extends StatefulWidget {

  const Modal({Key? key}) : super(key: key);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal>  {
  bool builded = false;
  int builds = 0;

  Future<void> _onBuiled() => Future.delayed(
    const Duration(milliseconds: 1),
    () {
      devtools.log('Stated Chaed!!!!!!');

      if(builds == 0) setState(() => builds = 1);
    }
  );

  @override
  Widget build(BuildContext context) {
    // return const SizedBox.shrink();

    if(builds == 0) _onBuiled();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      )
    );

    return Stack(
      children: [
     BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: GestureDetector(
        onTap: () {
          devtools.log("On Tag Modal");

            setState(() {
              if(builds == 1) builds = 2;
              else builds = 1;
            });
        } ,
        child: Container(
          color: const Color(0x15000000),
        ),
      ),
    ),
     AnimatedAlign(
        alignment: builds == 1 ? const Alignment(0, 1) : const Alignment(0, 3),
        // alignment: Alignment(0, 3),
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(50)
          ),
          child: Container(
            width: double.infinity,
            height: 300,
            color: Colors.white,
          ),
        ),
      )
      ],
    );
  }
}