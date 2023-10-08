import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class RemoveCompetenciaUseCase {
  RemoveCompetenciaUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, bool>> call(String competenciaNome) async {
    try {
      await repository.deleteCompetencia(competenciaNome);
      return const Right(true);
    } catch (error) {
      return Left(Exception("Erro ao deletar competencia: $error"));
    }
  }
}
