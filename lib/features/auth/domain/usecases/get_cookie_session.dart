import 'package:template/features/auth/data/models/session_model.dart';

import '../repositories/auth_repository_abs.dart';

class GetLocalSession {
  final UserRepositoryAbs userRepository;

  GetLocalSession(this.userRepository);

  UserSession call() => userRepository.getCookieSession();
}