import 'package:emprego_aqui_app/data/user/repository/signin_repository.dart';
import 'package:emprego_aqui_app/domain/user/entities/signin_entity.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepository {
  factory SignInRepository() => getIt<SignInRepositoryImpl>();

  Future<UserCredential> signIn(SignIn userEntity);
}
