import 'package:emprego_aqui_app/data/aplicacao/repository/aplicacao_repository_impl.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/main.dart';

abstract class AplicacaoRepository {
  factory AplicacaoRepository() => getIt<AplicacaoRepositoryImpl>();

  Future<List<Aplicacao>> fetchAplicacoes();

  Future addAplicacao(Aplicacao aplicacao);

  Future removeAplicacao(String id);
}
