import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/user/entities/signin_entity.dart';
import 'package:emprego_aqui_app/domain/user/repository/signin_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  SignInUseCase(this._repository);

  final SignInRepository _repository;

  Future<Either<Exception, UserCredential>> call(SignIn signIn) async {
    try {
      final userCredential = await _repository.signIn(signIn);

      return Right(userCredential);
    } on FirebaseAuthException catch (error) {
      return Left(Exception("Erro ao logar: $error"));
    }
  }
}
