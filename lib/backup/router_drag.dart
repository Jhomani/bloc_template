import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation example',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/': return MyCustomRoute(
            builder: (_) => MyHomePage(),
            path: '/',
          );
          case '/details': return MyCustomRoute(
            builder: (_) => Somewhere(),
            path: '/details',
          );
        }
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation example'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget> [
            DrawerHeader(
              child: Container(
                  child: const Text('This is a header'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.navigate_next),
              title: const Text('Navigate somewhere'),
              onTap: () {
                Navigator.pushNamed(context, '/somewhere');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: FlatButton(
          child: Text('View Details'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
            );
          },
        ),
      ),
    );
  }
}

class Somewhere extends StatelessWidget {
  const Somewhere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      appBar: AppBar(
        title: Text('Somewhere'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: const Text('This is a header'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}