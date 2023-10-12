import 'package:emprego_aqui_app/data/aplicacao/dto/aplicacao_dto.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';

class AplicacaoMapper {
  Aplicacao fromDTOToEntity(AplicacaoDTO aplicacaoDTO) {
    return Aplicacao(
      vagaNome: aplicacaoDTO.nomeVaga,
      id: aplicacaoDTO.idVaga,
      empresaNome: aplicacaoDTO.empresaNome,
    );
  }

  AplicacaoDTO fromEntityToDTO(Aplicacao aplicacao) {
    return AplicacaoDTO(
      nomeVaga: aplicacao.vagaNome,
      idVaga: aplicacao.id,
      empresaNome: aplicacao.empresaNome,
    );
  }
}
