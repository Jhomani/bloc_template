import 'package:template/features/auth/data/models/login_.dart';
import 'package:template/features/auth/data/models/token.dart';
import 'package:template/features/auth/data/repositories/login_repository.dart';

class LoginUserCase  {
  final LoginRepository repository = LoginRepository();

  Future<TokenModel?> call(LoginModel credentials) async {
    return await repository.login(credentials);
  }
}
