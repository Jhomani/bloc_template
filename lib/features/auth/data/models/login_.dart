import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntiry{
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
}

// typedef JSONSupport<T> = dynamic Function(Map<String, dynamic>);

// abstract class JSONSupport<T> {
//   factory T.fromJSON(Map<String, dynamic> map);
// }
