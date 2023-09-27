class UserDTO {
  final String user;
  final String password;

  UserDTO({
    required this.user,
    required this.password,
  });

  @override
  String toString() {
    return 'user: $user, password: $password';
  }
}
