import 'package:emprego_aqui_app/data/user/dto/user_dto.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';

class UserMapper {
  UserDTO fromEntityToDTO(UserEntity userEntity) {
    UserDTO userDTO = UserDTO(
      user: userEntity.user,
      password: userEntity.password,
    );

    return userDTO;
  }
}
