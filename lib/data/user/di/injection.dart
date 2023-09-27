import 'package:emprego_aqui_app/data/user/data_source/user_data_source.dart';
import 'package:emprego_aqui_app/data/user/mapper/user_mapper.dart';
import 'package:emprego_aqui_app/data/user/repository/user_repository.dart';
import 'package:emprego_aqui_app/main.dart';

class UserInjector {
  UserInjector() {
    init();
  }

  init() {
    getIt.registerSingleton(UserMapper());
    getIt.registerSingleton(UserDataSource());
    getIt.registerSingleton(UserRepositoryImpl(
      userDataSource: UserDataSource(),
      userMapper: UserMapper(),
    ));
  }
}
