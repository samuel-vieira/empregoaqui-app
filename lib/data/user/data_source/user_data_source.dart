import 'package:emprego_aqui_app/data/user/dto/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataSource {
  UserDataSource();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> singIn(UserDTO userDto) async {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: userDto.user,
      password: userDto.password,
    );
  }
}
