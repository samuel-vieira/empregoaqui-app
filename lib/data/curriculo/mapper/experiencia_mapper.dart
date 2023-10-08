import 'package:emprego_aqui_app/data/curriculo/dto/experiencia_dto.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';

class ExperienciaMapper {
  Experiencia fromDTOToEntity(ExperienciaDTO experienciaDTO) {
    return Experiencia(
      empresa: experienciaDTO.empresa,
      descricao: experienciaDTO.descricao,
      dataInicio: experienciaDTO.tempoInicio,
      dataFim: experienciaDTO.tempoFim,
      cargo: experienciaDTO.cargo,
    );
  }

  ExperienciaDTO fromEntityToDTO(Experiencia experiencia) {
    return ExperienciaDTO(
      empresa: experiencia.empresa,
      descricao: experiencia.descricao,
      cargo: experiencia.cargo,
      tempoInicio: experiencia.dataInicio,
      tempoFim: experiencia.dataFim,
    );
  }
}
