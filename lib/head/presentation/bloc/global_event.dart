part of 'global_bloc.dart';

class GlobalEvent {
  const GlobalEvent();
}

class PushFavorite extends GlobalEvent{
  final int favorite;

  const PushFavorite(this.favorite);
}

