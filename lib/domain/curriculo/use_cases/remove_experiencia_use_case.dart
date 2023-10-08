import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class RemoveExperienciaUseCase {
  RemoveExperienciaUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, bool>> call(String experienciaNome) async {
    try {
      await repository.removeExperiencia(experienciaNome);

      return const Right(true);
    } catch (error) {
      return Left(Exception('Erro ao deletar experiencia: $error'));
    }
  }
}
