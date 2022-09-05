import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'notification_setup.dart';

Future<void> _firebaseMessagingBackground(RemoteMessage message) async {
  AwesomeNotifications notification = initNotification();

  notification.createNotification(
    content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'From Backgroup Notification',
        body: 'Simple body'
    )
  );

}


Future<void> initFirebase () async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackground);
}