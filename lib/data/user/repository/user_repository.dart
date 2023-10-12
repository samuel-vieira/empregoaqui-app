import 'package:emprego_aqui_app/data/user/data_source/user_data_source.dart';
import 'package:emprego_aqui_app/data/user/dto/user_dto.dart';
import 'package:emprego_aqui_app/data/user/mapper/user_mapper.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/domain/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.userDataSource,
    required this.userMapper,
  });

  final UserDataSource userDataSource;
  final UserMapper userMapper;

  @override
  Future<UserEntity> fetchUser() async {
    try {
      final UserDTO userDTO = await userDataSource.fetchUser();

      final UserEntity userEntity = userMapper.fromDTOToEntity(userDTO);

      return userEntity;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future updateUser(Map<String, dynamic> data) async {
    try {
      return userDataSource.updateUser(data);
    } catch (error) {
      rethrow;
    }
  }
}
