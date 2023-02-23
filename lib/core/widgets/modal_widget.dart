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
    () {setState(() => builds = 1);}
  );

  double _getFreeSpaceFactor(double screenSize, double boxSize) {
    final freeSpace = screenSize - boxSize;
    final resp = (2/freeSpace) * boxSize;

    return resp + 1;
  }

  @override
  Widget build(BuildContext context) {
    double box = 400;

    double height = MediaQuery.of(context).size.height;
    double positionFactor = _getFreeSpaceFactor(height, box);

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
              builds = builds == 1 ? 2 : 1;
            });
        } ,
        child: Container(
          color: const Color(0x30000000),
        ),
      ),
    ),
     AnimatedAlign(
        alignment: builds == 1
          ? const Alignment(0, 1) 
          : Alignment(0, positionFactor),
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(50)
          ),
          child: Container(
            width: double.infinity,
            height: box,
            color: Colors.white,
          ),
        ),
      )
      ],
    );
  }
}