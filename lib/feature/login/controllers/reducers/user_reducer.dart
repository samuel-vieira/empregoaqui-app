import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/get_user_use_case.dart';
import 'package:emprego_aqui_app/domain/user/use_cases/update_user_use_case.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';
import 'package:flutter/material.dart';

class UserReducer extends Reducer {
  UserReducer({
    required this.getUserUseCase,
    required this.updateUserUseCase,
  }) {
    on(() => [fetchUserInfoState.value], _fetchUserInfo);
    on(() => [updateUserInfoState.value], _updateUserInfo);
  }

  final GetUserUseCase getUserUseCase;
  final UpdateUserUseCase updateUserUseCase;

  _fetchUserInfo() async {
    final response = await getUserUseCase.call();

    response.either(
      (left) => debugPrint("Erro ao buscar usuário ${left.toString()}"),
      (right) {
        userInfoAtom.value = right;
      },
    );
  }

  _updateUserInfo() async {
    final response = await updateUserUseCase.call(userDataToUpdate.value);

    response.either(
      (left) => debugPrint(left.toString()),
      (right) => fetchUserInfoState.call(),
    );
  }
}
