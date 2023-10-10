import 'package:emprego_aqui_app/data/aplicacao/data_source/aplicacao_data_source.dart';
import 'package:emprego_aqui_app/data/aplicacao/mapper/aplicacao_mapper.dart';
import 'package:emprego_aqui_app/data/aplicacao/repository/aplicacao_repository_impl.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';

class AplicacaoInjector {
  AplicacaoInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(
      AplicacaoDataSource(
        getIt<FirebaseService>(),
      ),
    );
    getIt.registerSingleton(
      AplicacaoMapper(),
    );
    getIt.registerSingleton(
      AplicacaoRepositoryImpl(
        aplicacaoDataSource: getIt<AplicacaoDataSource>(),
        aplicacaoMapper: getIt<AplicacaoMapper>(),
      ),
    );
  }
}
