import 'package:emprego_aqui_app/data/vagas/data_source/vagas_data_source.dart';
import 'package:emprego_aqui_app/data/vagas/dto/vaga_dto.dart';
import 'package:emprego_aqui_app/data/vagas/mapper/vaga_mapper.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/domain/vagas/repository/vagas_repository.dart';

class VagasRepositoryImpl implements VagasRepository {
  VagasRepositoryImpl({
    required this.vagaDataSource,
    required this.mapper,
  });

  final VagasDataSource vagaDataSource;
  final VagaMapper mapper;

  @override
  Future<List<Vaga>> fetchVagas() async {
    List<Vaga> vagas = [];
    List<VagaDTO> vagasDTO = await vagaDataSource.fetchVagas();

    for (VagaDTO vaga in vagasDTO) {
      vagas.add(mapper.mapDTOtoEntity(vaga));
    }

    return vagas;
  }

  @override
  Future<Vaga> fetchVaga(String id) async {
    try {
      VagaDTO vagaDTO = await vagaDataSource.fetchVaga(id);

      Vaga vaga = mapper.mapDTOtoEntity(vagaDTO);

      return vaga;
    } catch (_) {
      rethrow;
    }
  }
}
