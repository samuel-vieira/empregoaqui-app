import 'package:emprego_aqui_app/data/curriculo/dto/curriculo_dto.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/curriculo_entity.dart';

class CurriculoMapper {
  Curriculo fromDTOtoEntity(CurriculoDTO curriculoDTO) {
    Curriculo curriculo = Curriculo(
      competencias: curriculoDTO.competencias,
      experiencias: curriculoDTO.experiencias,
    );

    return curriculo;
  }

  CurriculoDTO fromEntityToDTO(Curriculo curriculo) {
    CurriculoDTO curriculoDTO = CurriculoDTO(
      competencias: curriculo.competencias,
      experiencias: curriculo.competencias,
    );

    return curriculoDTO;
  }
}
