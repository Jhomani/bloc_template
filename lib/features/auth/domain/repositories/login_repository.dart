// import 'package:dartz/dartz.dart';

// import '../../../../core/error/failures.dart';
// import '../entities/number_trivia.dart';

import 'package:template/features/auth/data/models/login_.dart';
import 'package:template/features/auth/data/models/token.dart';

abstract class LoginRepository {
  Future<TokenModel> login(LoginModel credentials);
  // Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}