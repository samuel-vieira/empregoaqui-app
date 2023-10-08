import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class GetExperienciasUseCase {
  GetExperienciasUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, List<Experiencia>>> call() async {
    try {
      final experiencias = await repository.fetchExperiencias();

      return Right(experiencias);
    } catch (error) {
      return Left(Exception('Erro ao buscar experiencias: $error'));
    }
  }
}
