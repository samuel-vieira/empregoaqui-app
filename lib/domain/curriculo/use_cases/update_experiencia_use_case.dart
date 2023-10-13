import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class UpdateExperienciaUseCase {
  UpdateExperienciaUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, bool>> call(
      String id, Map<String, dynamic> data) async {
    try {
      await repository.updateExperiencia(id, data);

      return const Right(true);
    } catch (error) {
      return Left(
        Exception("Erro ao atualizar experiencia: $error"),
      );
    }
  }
}
