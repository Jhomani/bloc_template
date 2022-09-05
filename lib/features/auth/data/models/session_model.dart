import '../../domain/entities/user_session_entity.dart';

class UserSession extends UserSessionEntity {
  UserSession({
    required super.token,
    required super.name,
    required super.isFirstOpen,
    required super.lastLogged
  });

  factory UserSession.fromJSON(Map<String, dynamic> json){
    return UserSession(
      token: json["token"],
      name: json["name"],
      isFirstOpen: json["isFirstOpen"],
      lastLogged: json["lastLogged"]
    );
  }

  Map<String, dynamic> toObject() => {
    "token" : token,
    "name" : name,
    "isFirstOpen" : isFirstOpen,
    "lastLogged" : lastLogged
  };
}