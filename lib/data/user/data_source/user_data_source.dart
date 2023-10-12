import 'package:emprego_aqui_app/data/user/dto/signin_dto.dart';
import 'package:emprego_aqui_app/data/user/dto/user_dto.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataSource {
  UserDataSource({required this.firebaseService});

  final FirebaseService firebaseService;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> singIn(SignInDTO signInDTO) async {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: signInDTO.user,
      password: signInDTO.password,
    );
  }

  Future<UserDTO> fetchUser() async {
    try {
      final encodedUser = await firebaseService.userRef.get();

      final userDTO = UserDTO.fromFirestore(encodedUser.data());

      return userDTO;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future updateUser(Map<String, dynamic> data) async {
    try {
      return firebaseService.userRef.update(data);
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
