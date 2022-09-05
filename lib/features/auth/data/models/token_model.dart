import '../../domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({
    required super.token,
    required super.name
  });

  factory TokenModel.fromJSON(Map<String, dynamic> map) => TokenModel(
    token: map['token'],
    name: map['name'],
  );

  @override
  String toString() => 'token: $token,  name$name';
}
