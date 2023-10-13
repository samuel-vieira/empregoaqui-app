import 'package:emprego_aqui_app/data/curriculo/data_source/curriculo_data_source.dart';
import 'package:emprego_aqui_app/data/curriculo/dto/competencia_dto.dart';
import 'package:emprego_aqui_app/data/curriculo/dto/curriculo_dto.dart';
import 'package:emprego_aqui_app/data/curriculo/dto/experiencia_dto.dart';
import 'package:emprego_aqui_app/data/curriculo/mapper/competencia_mapper.dart';
import 'package:emprego_aqui_app/data/curriculo/mapper/curriculo_mapper.dart';
import 'package:emprego_aqui_app/data/curriculo/mapper/experiencia_mapper.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/curriculo_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';

class CurriculoRepositoryImpl implements CurriculoRepository {
  CurriculoRepositoryImpl({
    required this.curriculoDataSource,
    required this.curriculoMapper,
    required this.competenciaMapper,
    required this.experienciaMapper,
  });

  final CurriculoDataSource curriculoDataSource;
  final CurriculoMapper curriculoMapper;
  final CompetenciaMapper competenciaMapper;
  final ExperienciaMapper experienciaMapper;

  @override
  Future<Curriculo> fetchCurriculo() async {
    try {
      CurriculoDTO curriculoDTO = await curriculoDataSource.fetchCurriculo();

      Curriculo curriculo = curriculoMapper.fromDTOtoEntity(curriculoDTO);

      return curriculo;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Competencia>> fetchCompetencias() async {
    try {
      List<CompetenciaDTO> competenciasDTO =
          await curriculoDataSource.fetchCompetencias();
      List<Competencia> competencias = [];

      for (var competenciaDTO in competenciasDTO) {
        Competencia competencia =
            competenciaMapper.fromDTOToEntity(competenciaDTO);
        competencias.add(competencia);
      }

      return competencias;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future addCompetencia(Competencia competencia) {
    try {
      CompetenciaDTO competenciaDTO =
          competenciaMapper.fromEntityToDTO(competencia);

      return curriculoDataSource.addCompetencia(competenciaDTO);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future deleteCompetencia(String competenciaNome) async {
    try {
      return curriculoDataSource.deleteCompetencia(competenciaNome);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Experiencia>> fetchExperiencias() async {
    try {
      List<ExperienciaDTO> experienciasDTO =
          await curriculoDataSource.fetchExperiencias();
      List<Experiencia> experiencias = [];

      for (var experienciaDTO in experienciasDTO) {
        Experiencia experiencia =
            experienciaMapper.fromDTOToEntity(experienciaDTO);
        experiencias.add(experiencia);
      }

      return experiencias;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future addExperiencia(Experiencia experiencia) async {
    try {
      final experienciaDTO = experienciaMapper.fromEntityToDTO(experiencia);

      curriculoDataSource.addExperiencia(experienciaDTO);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future removeExperiencia(String id) {
    try {
      return curriculoDataSource.deleteExperiencia(id);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future updateExperiencia(String id, Map<String, dynamic> data) {
    try {
      return curriculoDataSource.updateExperiencia(id, data);
    } catch (error) {
      rethrow;
    }
  }
}
