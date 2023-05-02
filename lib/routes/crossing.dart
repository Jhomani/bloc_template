import 'package:flutter/material.dart';
import 'package:template/features/auth/presentation/pages/login_page.dart';
import 'package:template/features/auth/presentation/pages/show_visibility.dart';
import 'middleware.dart';

typedef RouteBuilder = Widget Function(BuildContext);

Route<dynamic>? routesGenerator(RouteSettings settings) {
  MyCustomRoute response;

  Map<String, RouteBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/home': (context) => const HomePage(),
    // '/': (context) => MyHomePage(),
  };

  if(routes.containsKey(settings.name)) {
    String path = settings.name as String;

    response =  MyCustomRoute(
      builder: routes[path]!,
      path: path,
    );
  } else {
    response =  MyCustomRoute(
      builder: (context) => const Text("Screen Not Found"),
      path: '/404',
    );
  }

  return response;
}
