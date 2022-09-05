import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/constants/sp_keys.dart';
import 'package:template/core/network/http_errors.dart';

import '../models/session_model.dart';

class UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSource({required this.sharedPreferences});

  UserSession getUserSession() {
    final currentSession = sharedPreferences.getString(
      SPKeys.spUserSession
    );

    if(currentSession != null) {
      throw EntityNotFound("Session Not Found");
    }

    return UserSession.fromJSON(jsonDecode(currentSession!));
  }

  Future<void> setUserSession(UserSession session) async{
    await sharedPreferences.setString(
      SPKeys.spUserSession,
      jsonEncode(session.toObject()),
    );
  }

  void deleteUserSession() async {
    await sharedPreferences.remove(SPKeys.spUserSession);
  }
}