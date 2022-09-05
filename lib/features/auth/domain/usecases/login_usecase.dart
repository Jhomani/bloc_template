import 'package:template/features/auth/data/models/credentials_model.dart';

import '../repositories/auth_repository_abs.dart';

class LoginUseCase {
  final UserRepositoryAbs userRepository;

  LoginUseCase (this.userRepository);

  Future<void> call(CredentialModel credential) async => 
    await userRepository.login(credential);
}