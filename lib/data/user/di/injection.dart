import 'package:emprego_aqui_app/data/user/data_source/user_data_source.dart';
import 'package:emprego_aqui_app/data/user/mapper/signin_mapper.dart';
import 'package:emprego_aqui_app/data/user/mapper/user_mapper.dart';
import 'package:emprego_aqui_app/data/user/repository/signin_repository.dart';
import 'package:emprego_aqui_app/data/user/repository/user_repository.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';

class UserInjector {
  UserInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(UserMapper());
    getIt.registerSingleton(
        UserDataSource(firebaseService: getIt<FirebaseService>()));
    getIt.registerSingleton(UserRepositoryImpl(
      userDataSource: getIt<UserDataSource>(),
      userMapper: getIt<UserMapper>(),
    ));
    getIt.registerSingleton(SignInMapper());
    getIt.registerSingleton(
      SignInRepositoryImpl(
        mapper: getIt<SignInMapper>(),
        userDataSource: getIt<UserDataSource>(),
      ),
    );
  }
}
