import 'package:asp/asp.dart';
import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/signin_usecase.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';

class UserReducer extends Reducer {
  UserReducer({required this.signInUseCase}) {
    on(() => [signInAction.value], _signIn);
  }

  final SignInUseCase signInUseCase;

  _signIn() {
    if (username.value.isEmpty || password.value.isEmpty) {
      return;
    }

    UserEntity user = UserEntity(
      user: username.value,
      password: password.value,
    );

    final result = signInUseCase.call(user);

    result.either(
      (left) => false,
      (right) => true,
    );
  }
}
