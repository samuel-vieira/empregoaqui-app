import 'package:emprego_aqui_app/data/aplicacao/data_source/aplicacao_data_source.dart';
import 'package:emprego_aqui_app/data/aplicacao/mapper/aplicacao_mapper.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/domain/aplicacao/repository/aplicacao_repository.dart';

class AplicacaoRepositoryImpl implements AplicacaoRepository {
  AplicacaoRepositoryImpl({
    required this.aplicacaoDataSource,
    required this.aplicacaoMapper,
  });

  final AplicacaoDataSource aplicacaoDataSource;
  final AplicacaoMapper aplicacaoMapper;

  @override
  Future<List<Aplicacao>> fetchAplicacoes() async {
    try {
      final List<Aplicacao> aplicacoes = [];
      final aplicacoesDTO = await aplicacaoDataSource.fetchAplicacoes();

      for (var aplicacaoDTO in aplicacoesDTO) {
        aplicacoes.add(aplicacaoMapper.fromDTOToEntity(aplicacaoDTO));
      }

      return aplicacoes;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future addAplicacao(Aplicacao aplicacao) async {
    try {
      return aplicacaoDataSource.addAplicacao(
        aplicacaoMapper.fromEntityToDTO(aplicacao),
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future removeAplicacao(String id) {
    try {
      return aplicacaoDataSource.removeAplicacao(id);
    } catch (error) {
      rethrow;
    }
  }
}
