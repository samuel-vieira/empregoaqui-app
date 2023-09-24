import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/domain/vagas/repository/vagas_repository.dart';

class GetVagasUseCase {
  GetVagasUseCase({required VagasRepository repository})
      : _repository = repository;

  final VagasRepository _repository;

  Future<Either<Exception, List<Vaga>>> call() async {
    try {
      List<Vaga> vagas = await _repository.fetchVagas();
      return Right(vagas);
    } catch (error) {
      return Left(Exception("Erro ao buscar vagas: $error"));
    }
  }
}
