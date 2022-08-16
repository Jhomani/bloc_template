abstract class LoadAction {
  const LoadAction();
}

class LoginAction implements LoadAction {
  final String user;
  final String password;

  const LoginAction({
    required this.user,
    required this.password,
  }) : super();
}
