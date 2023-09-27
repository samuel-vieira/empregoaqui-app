class UserEntity {
  final String user;
  final String password;

  UserEntity({
    required this.user,
    required this.password,
  });

  @override
  String toString() {
    return 'user: $user, password: $password';
  }
}
