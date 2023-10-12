import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/domain/vagas/repository/vagas_repository.dart';

class GetVagaUseCase {
  GetVagaUseCase({required this.repository});

  final VagasRepository repository;

  Future<Either<Exception, Vaga>> call(String id) async {
    try {
      final vaga = await repository.fetchVaga(id);
      return Right(vaga);
    } catch (error) {
      return Left(Exception('Erro ao buscar vaga: $error'));
    }
  }
}
