import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'dart:io';

import './events/login_events.dart';

enum PersonUrl {
  persons1,
  persons2,
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons1:
        return 'http://127.0.0.1:5500/api/persons1.json';
      case PersonUrl.persons2:
        return 'http://127.0.0.1:5500/api/persons2.json';
    }
  }
}

class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;

  @override
  String toString() => 'Person (name = $name, age = $age)';
}

class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;
  const FetchResult({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  String toString() =>
    'FetchResult (isRetrievedFromCache = $isRetrievedFromCache, persons = $persons)';
}


class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};

  PersonsBloc() : super(null) {
    on<LoginAction>((event, emit) async {
      final url = event.user;

      if (_cache.containsKey(url)) {
        // we have the value in the cache
        final cachedPersons = _cache[url]!;
        final result = FetchResult(
          persons: cachedPersons,
          isRetrievedFromCache: true,
        );

        emit(result);
      } else {
        // final persons = await getPersons(url.urlString);
        // _cache[url] = persons;
        const result = FetchResult(
          persons: [],
          isRetrievedFromCache: false,
        );

        emit(result);
      }
    });
  }
}
