import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/injections/bloc_injection.dart';
import 'head/presentation/bloc/global_bloc.dart';
import 'app.dart';
import 'settings/notification_setup.dart';

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

      child: const App()
    )
  );
}
