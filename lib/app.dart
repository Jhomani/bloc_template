import 'package:flutter/material.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/routes/crossing.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _CleanedBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details
  ) => child;
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Timer? timer = null;

    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'HelveticaNeue',
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        //   }
        // )
      ),
      builder: (context, child) {
        'Rebuilding....'.log();

        // timer?.cancel();
        // timer = Timer(const Duration(seconds: 1), () {
        //   'Throw Evernt'.log();
        // });

        return Stack(
          children: [
            Material(child: child)
          ]
        );
      }, 
      scrollBehavior: _CleanedBehavior(),
      onGenerateRoute: routesGenerator,
      initialRoute: '/login',
    );
  } 
}