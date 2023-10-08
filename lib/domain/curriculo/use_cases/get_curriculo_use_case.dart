import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/curriculo_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class GetCurriculoUseCase {
  GetCurriculoUseCase({required this.repository});

  final CurriculoRepository repository;

  Future<Either<Exception, Curriculo>> call() async {
    try {
      Curriculo curriculo = await repository.fetchCurriculo();

      return Right(curriculo);
    } catch (error) {
      return Left(Exception('Erro ao buscar curriculo: $error'));
    }
  }
}
