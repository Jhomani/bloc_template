import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntiry{
  LoginModel({
    required super.user,
    required super.password
  });

  factory LoginModel.todoCreator(Map<String, dynamic> map) => LoginModel(
    user: map['user'],
    password: map['password'],
  );

  Map<String, dynamic> toObject() => ({
    'user': user,
    'password': password,
  });
}
