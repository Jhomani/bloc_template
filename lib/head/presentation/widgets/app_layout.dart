import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/global_bloc.dart';

class Wrapper extends StatelessWidget {
  final Widget child;

  const Wrapper({
    required this.child,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: BlocProvider.of<GlobalBloc>(context),
    child: Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/tecnol_title_logo.png",
          height: 20,
          fit: BoxFit.fitHeight
        ),
        backgroundColor: Colors.white,
      ),
      body: child,
    ),
  );
}