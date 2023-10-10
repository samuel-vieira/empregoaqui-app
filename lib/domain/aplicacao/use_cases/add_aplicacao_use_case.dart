import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/domain/aplicacao/repository/aplicacao_repository.dart';

class AddAplicacaoUseCase {
  AddAplicacaoUseCase({required this.repository});

  final AplicacaoRepository repository;

  Future<Either<Exception, bool>> call(Aplicacao aplicacao) async {
    try {
      await repository.addAplicacao(aplicacao);

      return const Right(true);
    } catch (error) {
      return Left(
        Exception('Erro ao adicionar aplicacao: $error'),
      );
    }
  }
}
