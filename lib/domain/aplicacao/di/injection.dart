import 'package:emprego_aqui_app/domain/aplicacao/repository/aplicacao_repository.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/add_aplicacao_use_case.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/get_aplicacoes_use_case.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/remove_aplicacao_use_case.dart';
import 'package:emprego_aqui_app/feature/home/controllers/reducers/aplicacao_reducer.dart';
import 'package:emprego_aqui_app/main.dart';

class AplicacaoDomainInjector {
  AplicacaoDomainInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(AplicacaoRepository());
    getIt.registerSingleton(
      GetAplicacoesUseCase(
        repository: getIt<AplicacaoRepository>(),
      ),
    );
    getIt.registerSingleton(
      AddAplicacaoUseCase(
        repository: getIt<AplicacaoRepository>(),
      ),
    );
    getIt.registerSingleton(
      RemoveAplicacaoUseCase(
        repository: getIt<AplicacaoRepository>(),
      ),
    );
    getIt.registerSingleton(
      AplicacaoReducer(
        getAplicacoesUseCase: getIt<GetAplicacoesUseCase>(),
        addAplicacaoUseCase: getIt<AddAplicacaoUseCase>(),
        removeAplicacaoUseCase: getIt<RemoveAplicacaoUseCase>(),
      ),
    );
  }
}
