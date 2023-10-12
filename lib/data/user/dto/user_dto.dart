class UserDTO {
  final String userName;
  final String email;
  final String telefone;

  UserDTO({
    required this.userName,
    required this.email,
    required this.telefone,
  });

  @override
  String toString() {
    return 'user: $userName, password: $email';
  }

  factory UserDTO.fromFirestore(dynamic json) {
    return UserDTO(
      userName: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
    );
  }

  Map<String, Object> toFirestore() {
    return {};
  }
}
