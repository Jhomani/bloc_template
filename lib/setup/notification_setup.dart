import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

AwesomeNotifications initNotification() {
  var notification = AwesomeNotifications();

  notification.initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white
      )
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
        channelGroupkey: 'basic_channel_group',
        channelGroupName: 'Basic group'
      )
    ],
    debug: true
  );

  return notification;
}