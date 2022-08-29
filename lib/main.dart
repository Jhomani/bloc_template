import 'package:flutter/material.dart';
import 'routes/interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer' as devtools;
import 'package:awesome_notifications/awesome_notifications.dart';

void initNotification() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white)
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupkey: 'basic_channel_group',
          channelGroupName: 'Basic group')
    ],
    debug: true
  );
}


Future<void> initFirebase () async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white)
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupkey: 'basic_channel_group',
          channelGroupName: 'Basic group')
    ],
    debug: true
  );

  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'From Backgroup Notification',
        body: 'Simple body'
    )
  );

  devtools.log("Handling a background message: ${message.messageId}");
}

void main() async {
  await initFirebase();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();
  devtools.log('TOKEN: $token');

  initNotification();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    devtools.log('Got a message whilst in the foreground!');
    devtools.log('Message data: ${message.data}');

    if (message.notification != null) {
      devtools.log('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation example',
      onGenerateRoute: routesGenerator,
    );
  }
}
