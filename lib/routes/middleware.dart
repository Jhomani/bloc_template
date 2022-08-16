import 'package:flutter/material.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  String path;

  MyCustomRoute({
    required WidgetBuilder builder,
    required this.path 
  }): super(builder: builder);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child
  ) {
    if (path == '/') return child;
    // Fades between routes. (If you don't want any animation, 
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}