import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtools;

import 'package:template/features/auth/domain/usecases/get_cookie_session.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final GetLocalSession getSession;

  GlobalBloc({
    required this.getSession
  }): super(GlobalState(favorites: [])) {
    devtools.log("App is Starting...");

    on<PushFavorite>(_addFavorite);
  }

  void dispatch(GlobalState payload) {
    // ignore: invalid_use_of_visible_for_testing_member
    // emit(GlobalState(
    //   session: payload.session ?? state.session,
    //   favorites: state.favorites, 
    // ));
  }
  
  Future<void> _addFavorite(
    PushFavorite event,
    Emitter<GlobalState> emmit,
  ) async {
    emmit(GlobalState(
      favorites: [...state.favorites, 1], 
    ));

    devtools.log("Was addd new VALUE....");
  }
}