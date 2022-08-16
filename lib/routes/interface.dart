import 'package:flutter/material.dart';
import './middleware.dart';

import '../features/auth/presentation/pages/pages.dart';
import '../features/home/presentation/pages/pages.dart';

Route<dynamic>? routesGenerator(RouteSettings settings) {
  switch (settings.name) {
    case '/': return MyCustomRoute(
      builder: (_) => MyHomePage(),
      path: '/',
    );
    case '/login': return MyCustomRoute(
      builder: (_) => const LoginPage(),
      path: '/login',
    );
  }

  return null;
}
