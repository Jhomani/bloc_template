import '../../domain/entities/login_entity.dart'; // @TODO: short this

class LoginModel extends LoginEntiry {
  LoginModel({
    required super.user,
    required super.password
  });

  factory LoginModel.fromJSON(Map<String, dynamic> map) => LoginModel(
    user: map['user'],
    password: map['password'],
  );

  Map<String, dynamic> toObject() => ({
    'user': user,
    'password': password,
  });

  @override
  String toString() => 'user: $user, password $password';
}
