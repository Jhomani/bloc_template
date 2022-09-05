import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/credentials_model.dart';
import '../models/session_model.dart';

import '../../domain/repositories/auth_repository_abs.dart';

import 'dart:developer' as devtools;

class UserRepository implements UserRepositoryAbs {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepository(this.remoteDataSource, this.userLocalDataSource);

  @override
  Future<void> login(CredentialModel credential) async {
    devtools.log("innit repository");
    final remoteUser = await remoteDataSource.login(credential);
    devtools.log(remoteUser.toString());

    UserSession userSession = UserSession(
      token: remoteUser.token,
      name: remoteUser.name,
      isFirstOpen: false,
      lastLogged: DateTime.now().millisecondsSinceEpoch
    );

    await userLocalDataSource.setUserSession(userSession);
  }

  @override
  UserSession getCookieSession() => userLocalDataSource.getUserSession(); 
}