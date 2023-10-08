import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class AddExperienciaUseCase {
  AddExperienciaUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, bool>> call(Experiencia experiencia) async {
    try {
      await repository.addExperiencia(experiencia);

      return const Right(true);
    } catch (error) {
      return Left(Exception("Erro ao adicionar experiencia"));
    }
  }
}
