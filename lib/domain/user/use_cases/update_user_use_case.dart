import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';

class UpdateUserUseCase {
  UpdateUserUseCase({
    required this.repository,
  });

  final UserRepository repository;

  Future<Either<Exception, bool>> call(Map<String, dynamic> data) async {
    try {
      await repository.updateUser(data);

      return const Right(true);
    } catch (error) {
      return Left(
        Exception("Erro ao atualizar usuário $error"),
      );
    }
  }
}
