import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  SignInUseCase(this._repository);

  final UserRepository _repository;

  Future<Either<Exception, UserCredential>> call(UserEntity user) async {
    try {
      final userCredential = await _repository.signIn(user);
      return Right(userCredential);
    } on FirebaseAuthException catch (error) {
      return Left(Exception("Erro ao logar: $error"));
    }
  }
}
