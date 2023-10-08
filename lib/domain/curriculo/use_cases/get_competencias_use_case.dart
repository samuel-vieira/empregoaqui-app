import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class GetCompetenciasUseCase {
  GetCompetenciasUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, List<Competencia>>> call() async {
    try {
      final response = await repository.fetchCompetencias();

      return Right(response);
    } catch (error) {
      return Left(Exception('Erro ao buscar competencias'));
    }
  }
}
