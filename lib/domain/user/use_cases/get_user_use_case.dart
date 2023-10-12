import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';

class GetUserUseCase {
  GetUserUseCase({required this.repository});

  final UserRepository repository;
  Future<Either<Exception, UserEntity>> call() async {
    try {
      final user = await repository.fetchUser();

      return Right(user);
    } catch (error) {
      return Left(
        Exception('Erro ao buscar usuário: $error'),
      );
    }
  }
}
