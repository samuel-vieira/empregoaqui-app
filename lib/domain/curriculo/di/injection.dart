import 'package:emprego_aqui_app/domain/curriculo/repository/curriculo_repository.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/add_competencias_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/add_experiencia_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/get_competencias_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/get_curriculo_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/get_experiencias_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/remove_competencia_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/remove_experiencia_use_case.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/reducer/curriculo_reducer.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/reducer/user_reducer.dart';
import 'package:emprego_aqui_app/main.dart';

class CurriculoDomainInjector {
  CurriculoDomainInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(CurriculoRepository());
    getIt.registerSingleton(
      GetCurriculoUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      AddCompetenciasUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      GetCompetenciasUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      RemoveCompetenciaUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      GetExperienciasUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      AddExperienciaUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      RemoveExperienciaUseCase(
        repository: getIt<CurriculoRepository>(),
      ),
    );
    getIt.registerSingleton(
      CurriculoReducer(
        getCurriculoUseCase: getIt<GetCurriculoUseCase>(),
        addCompetenciasUseCase: getIt<AddCompetenciasUseCase>(),
        getCompetenciasUseCase: getIt<GetCompetenciasUseCase>(),
        removeCompetenciaUseCase: getIt<RemoveCompetenciaUseCase>(),
        getExperienciasUseCase: getIt<GetExperienciasUseCase>(),
        addExperienciaUseCase: getIt<AddExperienciaUseCase>(),
        removeExperienciaUseCase: getIt<RemoveExperienciaUseCase>(),
      ),
    );
    getIt.registerSingleton(UserReducer());
  }
}
