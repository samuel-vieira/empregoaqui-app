import 'package:emprego_aqui_app/data/user/dto/signin_dto.dart';
import 'package:emprego_aqui_app/domain/user/entities/signin_entity.dart';

class SignInMapper {
  SignInDTO fromEntityToDTO(SignIn signIn) {
    return SignInDTO(
      user: signIn.user,
      password: signIn.password,
    );
  }
}
