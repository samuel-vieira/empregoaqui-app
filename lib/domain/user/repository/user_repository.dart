import 'package:emprego_aqui_app/data/user/repository/user_repository.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/main.dart';

abstract class UserRepository {
  factory UserRepository() => getIt<UserRepositoryImpl>();

  Future<UserEntity> fetchUser();

  Future updateUser(Map<String, dynamic> data);
}
