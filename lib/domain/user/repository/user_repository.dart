import 'package:emprego_aqui_app/data/user/repository/user_repository.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  factory UserRepository() => getIt<UserRepositoryImpl>();

  Future<UserCredential> signIn(UserEntity userEntity);
}
