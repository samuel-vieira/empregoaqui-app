import 'package:emprego_aqui_app/data/vagas/dto/vaga_dto.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';

class VagaMapper {
  mapDTOtoEntity(VagaDTO vagaDto) {
    return Vaga(
      nome: vagaDto.nome,
      modeloDeTrabalho: vagaDto.modeloTrabalho,
      nomeEmpresa: vagaDto.nomeEmpresa,
      principalTecnologia: vagaDto.requistos.first,
      tipoDeContrato: vagaDto.tipoDeContrato,
      salario: vagaDto.salario,
      sobreVaga: vagaDto.sobreVaga,
      sobreEmpresa: vagaDto.sobreEmpresa,
      requisitos: vagaDto.requistos,
      id: vagaDto.id,
    );
  }
}
