import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class AddCompetenciasUseCase {
  AddCompetenciasUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, bool>> call(Competencia competencia) async {
    try {
      await repository.addCompetencia(competencia);

      return const Right(true);
    } catch (error) {
      return Left(Exception('Erro ao adicionar competencia: $error'));
    }
  }
}
