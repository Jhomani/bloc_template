abstract class AuthAction {
  const AuthAction();
}

class LoginAction implements AuthAction {
  final String user;
  final String password;

  const LoginAction({
    required this.user,
    required this.password,
  }) : super();
}
