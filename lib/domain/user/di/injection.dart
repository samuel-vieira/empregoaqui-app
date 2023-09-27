import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/signin_usecase.dart';
import 'package:emprego_aqui_app/feature/login/controllers/reducers/user_reducer.dart';
import 'package:emprego_aqui_app/main.dart';

class UserDomainInjector {
  UserDomainInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(UserRepository());
    getIt.registerSingleton(SignInUseCase(getIt<UserRepository>()));
    getIt.registerSingleton(UserReducer(signInUseCase: getIt<SignInUseCase>()));
  }
}
