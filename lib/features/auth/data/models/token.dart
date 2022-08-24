import '../../domain/entities/login_entity.dart'; // @TODO: short this

class TokenModel extends TokenEntity {
  TokenModel({
    required super.token,
    required super.expire
  });

  factory TokenModel.jsonfy(Map<String, dynamic> map) => TokenModel(
    token: map['token'],
    expire: map['expire'],
  );

  @override
  String toString() => 'token: $token, expire $expire';
}
