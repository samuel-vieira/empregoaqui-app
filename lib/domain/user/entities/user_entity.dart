class UserEntity {
  final String username;
  final String email;
  final String telefone;

  UserEntity({
    required this.username,
    required this.email,
    required this.telefone,
  });

  @override
  String toString() {
    return 'user: $username, password: $email';
  }
}
