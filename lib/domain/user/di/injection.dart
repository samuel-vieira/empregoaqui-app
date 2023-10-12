import 'package:emprego_aqui_app/domain/user/repository/signin_repository.dart';
import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/get_user_use_case.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/signin_usecase.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/update_user_use_case.dart';
import 'package:emprego_aqui_app/feature/login/controllers/reducers/signin_reducer.dart';
import 'package:emprego_aqui_app/feature/login/controllers/reducers/user_reducer.dart';
import 'package:emprego_aqui_app/main.dart';

class UserDomainInjector {
  UserDomainInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(UserRepository());
    getIt.registerSingleton(
      GetUserUseCase(
        repository: getIt<UserRepository>(),
      ),
    );
    getIt.registerSingleton(
      UpdateUserUseCase(
        repository: getIt<UserRepository>(),
      ),
    );
    getIt.registerSingleton(
      UserReducer(
        getUserUseCase: getIt<GetUserUseCase>(),
        updateUserUseCase: getIt<UpdateUserUseCase>(),
      ),
    );
    getIt.registerSingleton(SignInRepository());
    getIt.registerSingleton(
      SignInUseCase(
        getIt<SignInRepository>(),
      ),
    );
    getIt.registerSingleton(
      SignInReducer(
        signInUseCase: getIt<SignInUseCase>(),
      ),
    );
  }
}
