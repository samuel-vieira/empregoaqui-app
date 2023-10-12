import 'package:emprego_aqui_app/data/user/data_source/user_data_source.dart';
import 'package:emprego_aqui_app/data/user/dto/signin_dto.dart';
import 'package:emprego_aqui_app/data/user/mapper/signin_mapper.dart';
import 'package:emprego_aqui_app/domain/user/entities/signin_entity.dart';
import 'package:emprego_aqui_app/domain/user/repository/signin_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInRepositoryImpl implements SignInRepository {
  SignInRepositoryImpl({
    required this.mapper,
    required this.userDataSource,
  });

  final SignInMapper mapper;
  final UserDataSource userDataSource;

  @override
  Future<UserCredential> signIn(SignIn signIn) {
    try {
      SignInDTO signInDTO = mapper.fromEntityToDTO(signIn);

      Future<UserCredential> userCredential = userDataSource.singIn(signInDTO);

      return userCredential;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
