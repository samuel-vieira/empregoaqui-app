import 'package:emprego_aqui_app/data/user/dto/user_dto.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';

class UserMapper {
  UserDTO fromEntityToDTO(UserEntity userEntity) {
    UserDTO userDTO = UserDTO(
      userName: userEntity.username,
      email: userEntity.email,
      telefone: userEntity.telefone,
    );

    return userDTO;
  }

  UserEntity fromDTOToEntity(UserDTO userDTO) {
    UserEntity user = UserEntity(
      username: userDTO.userName,
      email: userDTO.email,
      telefone: userDTO.telefone,
    );

    return user;
  }
}
