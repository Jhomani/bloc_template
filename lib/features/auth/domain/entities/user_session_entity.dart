abstract class UserSessionEntity {
  final String token, name;
  final bool isFirstOpen;
  final int lastLogged;

  const UserSessionEntity({
    required this.token,
    required this.name,
    required this.isFirstOpen,
    required this.lastLogged
  });
}