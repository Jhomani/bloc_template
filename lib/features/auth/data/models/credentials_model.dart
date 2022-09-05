import '../../domain/entities/credential.entity.dart';

class CredentialModel extends CredentialEntity {
  CredentialModel({
    required super.email,
    required super.password
  });

  Map<String, dynamic> toObject() => ({
    'email': email,
    'password': password,
  });

  @override
  String toString() => 'email: $email,  password$password';
}
