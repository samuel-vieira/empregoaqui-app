import 'package:emprego_aqui_app/data/curriculo/repository/curriculo_repository.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/curriculo_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/main.dart';

abstract class CurriculoRepository {
  factory CurriculoRepository() => getIt<CurriculoRepositoryImpl>();

  Future<Curriculo> fetchCurriculo();

  Future<List<Competencia>> fetchCompetencias();

  Future addCompetencia(Competencia competencia);

  Future deleteCompetencia(String competenciaNome);

  Future<List<Experiencia>> fetchExperiencias();

  Future addExperiencia(Experiencia experiencia);

  Future removeExperiencia(String id);

  Future updateExperiencia(String id, Map<String, dynamic> data);
}
