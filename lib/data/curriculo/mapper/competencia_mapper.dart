import 'package:emprego_aqui_app/data/curriculo/dto/competencia_dto.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';

class CompetenciaMapper {
  CompetenciaDTO fromEntityToDTO(Competencia competencia) {
    CompetenciaDTO competenciaDTO = CompetenciaDTO(
      nome: competencia.nome,
      tempo: competencia.tempo,
    );

    return competenciaDTO;
  }

  Competencia fromDTOToEntity(CompetenciaDTO competenciaDTO) {
    Competencia competencia = Competencia(
      nome: competenciaDTO.nome,
      tempo: competenciaDTO.tempo,
    );

    return competencia;
  }
}
