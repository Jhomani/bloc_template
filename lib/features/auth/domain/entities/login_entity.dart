abstract class LoginEntiry {
  final String user;
  final String password;

  LoginEntiry({
    required this.user,
    required this.password,
  });
}

abstract class TokenEntity {
  final String token;
  final String expire;

  TokenEntity({
    required this.token,
    required this.expire,
  });
}