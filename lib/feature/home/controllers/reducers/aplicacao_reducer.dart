import 'package:asp/asp.dart';
import 'package:either_dart/either.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/add_aplicacao_use_case.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/get_aplicacoes_use_case.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/remove_aplicacao_use_case.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:flutter/material.dart';

class AplicacaoReducer extends Reducer {
  AplicacaoReducer({
    required this.getAplicacoesUseCase,
    required this.addAplicacaoUseCase,
    required this.removeAplicacaoUseCase,
  }) {
    on(() => [fetchAplicacoesState], _fetchAplicacoes);
    on(() => [addAplicacaoState], _addAplicacao);
    on(() => [removeAplicacaoState], _removeAplicacao);
  }

  final GetAplicacoesUseCase getAplicacoesUseCase;
  final AddAplicacaoUseCase addAplicacaoUseCase;
  final RemoveAplicacaoUseCase removeAplicacaoUseCase;

  _fetchAplicacoes() async {
    final response = await getAplicacoesUseCase.call();

    response.either(
      (left) => debugPrint(left.toString()),
      (right) {
        aplicacoesAtom.clear();

        for (var aplicacao in right) {
          aplicacoesAtom.add(aplicacao);
        }
      },
    );
  }

  _addAplicacao() async {
    for (var aplicacao in aplicacoesAtom.value) {
      if (aplicacao.id == novaAplicacao.value.id) {
        return;
      }
    }

    final response = await addAplicacaoUseCase.call(novaAplicacao.value);

    response.either(
      (left) => debugPrint(left.toString()),
      (right) => fetchAplicacoesState.call(),
    );
  }

  _removeAplicacao() async {
    final response = removeAplicacaoUseCase.call(aplicacaoToRemove.value);

    response.either(
      (left) => debugPrint(left.toString()),
      (right) => fetchAplicacoesState.call(),
    );
  }
}
