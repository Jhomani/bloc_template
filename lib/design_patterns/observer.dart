import 'dart:developer';

class Subscription {
  String name;

  Subscription({
    required this.name
  });

  sendNotication(String name, String event) {
    log('New nofication $name to this event $event');
  }
}

class YoutubeChannel {
  String name;
  List<Subscription> subscriptions;

  YoutubeChannel({
    required this.name,
    this.subscriptions = const [],
  });

  subscribe(Subscription subs) {
    subscriptions.add(subs);
  }

  nofify(String event) {
    for(Subscription sub in subscriptions) {
      sub.sendNotication(name, event);
    }
  }
}
