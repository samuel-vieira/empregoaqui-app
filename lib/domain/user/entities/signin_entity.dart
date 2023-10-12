class SignIn {
  final String user;
  final String password;

  SignIn({
    required this.user,
    required this.password,
  });

  @override
  String toString() {
    return 'user: $user, password: $password';
  }
}
