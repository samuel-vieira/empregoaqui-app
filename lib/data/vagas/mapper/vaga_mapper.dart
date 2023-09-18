import 'package:emprego_aqui_app/data/vagas/dto/vaga_dto.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';

class VagaMapper {
  mapDTOtoEntity(VagaDTO vagaDto) {
    return Vaga(vagaDto.nome);
  }
}
