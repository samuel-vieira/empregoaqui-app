class SignInDTO {
  final String user;
  final String password;

  SignInDTO({
    required this.user,
    required this.password,
  });

  @override
  String toString() {
    return 'user: $user, password: $password';
  }
}
