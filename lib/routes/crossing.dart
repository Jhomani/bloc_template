import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/sign_in_page.dart';
import '../features/home/presentation/pages/pages.dart';
import 'middleware.dart';

typedef RouteBuilder = Widget Function(BuildContext);

Route<dynamic>? routesGenerator(RouteSettings settings) {
  MyCustomRoute response;

  Map<String, RouteBuilder> routes = {
    '/login': (context) => const SignInPage(),
    '/': (context) => MyHomePage(),
  };

  if(routes.containsKey(settings.name)) {
    String path = settings.name!;

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
