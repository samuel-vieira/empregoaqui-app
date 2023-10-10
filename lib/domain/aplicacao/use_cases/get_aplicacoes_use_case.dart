import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/domain/aplicacao/repository/aplicacao_repository.dart';

class GetAplicacoesUseCase {
  GetAplicacoesUseCase({required this.repository});

  final AplicacaoRepository repository;

  Future<Either<Exception, List<Aplicacao>>> call() async {
    try {
      final response = await repository.fetchAplicacoes();

      return Right(response);
    } catch (error) {
      return Left(Exception('Erro ao buscar aplicações: $error'));
    }
  }
}
