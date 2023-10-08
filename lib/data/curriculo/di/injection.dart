import 'package:emprego_aqui_app/data/curriculo/data_source/curriculo_data_source.dart';
import 'package:emprego_aqui_app/data/curriculo/mapper/competencia_mapper.dart';
import 'package:emprego_aqui_app/data/curriculo/mapper/curriculo_mapper.dart';
import 'package:emprego_aqui_app/data/curriculo/mapper/experiencia_mapper.dart';
import 'package:emprego_aqui_app/data/curriculo/repository/curriculo_repository.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';

class CurriculoInjector {
  CurriculoInjector() {
    init();
  }

  init() {
    getIt.registerLazySingleton(
      () => CurriculoDataSource(
        firebaseService: getIt<FirebaseService>(),
      ),
    );
    getIt.registerSingleton(CurriculoMapper());
    getIt.registerSingleton(CompetenciaMapper());
    getIt.registerSingleton(ExperienciaMapper());
    getIt.registerSingleton(
      CurriculoRepositoryImpl(
        curriculoDataSource: getIt<CurriculoDataSource>(),
        curriculoMapper: getIt<CurriculoMapper>(),
        competenciaMapper: getIt<CompetenciaMapper>(),
        experienciaMapper: getIt<ExperienciaMapper>(),
      ),
    );
  }
}
