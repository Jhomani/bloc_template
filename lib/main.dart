import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/injections/bloc_injection.dart';
import 'package:template/core/widgets/modal_widget.dart';
import 'head/presentation/bloc/global_bloc.dart';
import 'routes/crossing.dart';
import 'setup/notification_setup.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String? token = await messaging.getToken();
  // devtools.log('TOKEN: $token');

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   devtools.log('Got a message whilst in the foreground!');
  //   devtools.log('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     devtools.log('Message also contained a notification: ${message.notification}');
  //   }
  // });

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  initNotification();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(
          create: (context) => GetIt.instance<GlobalBloc>(),
        ),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    navigatorKey: navigatorKey,
    title: 'Navigation example',
    onGenerateRoute: routesGenerator,
    builder: (context, child) => Stack(
      children: [
        child!,
        Modal()
      ]
    ), 
    initialRoute: '/login',
  );
}
