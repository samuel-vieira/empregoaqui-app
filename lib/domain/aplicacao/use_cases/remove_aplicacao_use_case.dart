import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/aplicacao/repository/aplicacao_repository.dart';

class RemoveAplicacaoUseCase {
  RemoveAplicacaoUseCase({required this.repository});

  final AplicacaoRepository repository;

  Future<Either<Exception, bool>> call(String id) async {
    try {
      await repository.removeAplicacao(id);

      return const Right(true);
    } catch (error) {
      return Left(Exception('Erro ao remover aplicacao'));
    }
  }
}
