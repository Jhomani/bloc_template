part of 'global_bloc.dart';

class Session {
  final String token;

  const Session(this.token);
}

class GlobalState {
  Session? session; 
  List<int> favorites;

  GlobalState({
    required this.favorites,
    this.session,
  });
}