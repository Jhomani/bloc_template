import 'package:template/features/auth/data/models/credentials_model.dart';
import 'package:template/features/auth/data/models/session_model.dart';

abstract class UserRepositoryAbs {
  Future<void> login(CredentialModel credential);

  UserSession getCookieSession();
}