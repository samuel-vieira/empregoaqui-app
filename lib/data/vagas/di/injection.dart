import 'package:emprego_aqui_app/data/vagas/data_source/vagas_data_source.dart';
import 'package:emprego_aqui_app/data/vagas/mapper/vaga_mapper.dart';
import 'package:emprego_aqui_app/data/vagas/repository/vaga_repository_impl.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';

class VagasInjector {
  VagasInjector() {
    init();
  }

  init() {
    getIt.registerLazySingleton<VagasRepositoryImpl>(
      () => VagasRepositoryImpl(
        mapper: getIt<VagaMapper>(),
        vagaDataSource: getIt<VagasDataSource>(),
      ),
    );
    getIt.registerSingleton<VagaMapper>(VagaMapper());
    getIt.registerSingleton<VagasDataSource>(
      VagasDataSource(
        getIt<FirebaseService>(),
      ),
    );
  }
}
