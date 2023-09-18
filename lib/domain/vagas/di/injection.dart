import 'package:emprego_aqui_app/domain/vagas/repository/vagas_repository.dart';
import 'package:emprego_aqui_app/domain/vagas/use_cases/get_vagas_usecase.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/reducers/vaga_reducer.dart';
import 'package:emprego_aqui_app/main.dart';

class VagaDomainInjection {
  VagaDomainInjection() {
    init();
  }

  init() {
    getIt.registerSingleton(VagasRepository());
    getIt.registerSingleton(GetVagasUseCase(repository: getIt()));
    getIt.registerSingleton(VagaReducer(getIt()));
  }
}
