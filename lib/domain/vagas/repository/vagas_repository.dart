import 'package:emprego_aqui_app/data/vagas/repository/vaga_repository_impl.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/main.dart';

abstract class VagasRepository {
  factory VagasRepository() => getIt<VagasRepositoryImpl>();

  Future<List<Vaga>> fetchVagas();
}
