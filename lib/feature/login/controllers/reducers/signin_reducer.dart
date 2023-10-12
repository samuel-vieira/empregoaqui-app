import 'package:asp/asp.dart';
import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/user/entities/signin_entity.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/signin_usecase.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';

class SignInReducer extends Reducer {
  SignInReducer({required this.signInUseCase}) {
    on(() => [signInState], _signIn);
  }

  final SignInUseCase signInUseCase;

  _signIn() {
    if (email.value.isEmpty || password.value.isEmpty) {
      return;
    }

    SignIn user = SignIn(
      user: email.value,
      password: password.value,
    );

    final result = signInUseCase.call(user);

    result.either(
      (left) => false,
      (right) => true,
    );
  }
}
