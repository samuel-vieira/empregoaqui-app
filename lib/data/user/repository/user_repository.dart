import 'package:emprego_aqui_app/data/user/data_source/user_data_source.dart';
import 'package:emprego_aqui_app/data/user/dto/user_dto.dart';
import 'package:emprego_aqui_app/data/user/mapper/user_mapper.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.userDataSource, required this.userMapper});

  final UserDataSource userDataSource;
  final UserMapper userMapper;

  @override
  Future<UserCredential> signIn(UserEntity userEntity) async {
    try {
      UserDTO userDTO = userMapper.fromEntityToDTO(userEntity);

      Future<UserCredential> userCredential = userDataSource.singIn(userDTO);

      return userCredential;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
