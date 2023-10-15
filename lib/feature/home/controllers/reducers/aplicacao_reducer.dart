import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/add_aplicacao_use_case.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/get_aplicacoes_use_case.dart';
import 'package:emprego_aqui_app/domain/aplicacao/use_cases/remove_aplicacao_use_case.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/shared/routes/routes.dart';
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
    aplicacaoLoading.value = true;
    final response = await getAplicacoesUseCase.call();

    response.either(
      (left) => debugPrint("Erro ao buscar vagas: $left"),
      (right) {
        aplicacoesAtom.clear();

        for (var aplicacao in right) {
          aplicacoesAtom.add(aplicacao);
        }
      },
    );

    aplicacaoLoading.value = false;
  }

  _addAplicacao() async {
    aplicacaoStatus.value = AplicacaoStatus.loading;

    for (var aplicacao in aplicacoesAtom.value) {
      if (aplicacao.id == novaAplicacao.value.id) {
        aplicacaoStatus.value = AplicacaoStatus.aplicationAlreadyExists;
        await Future.delayed(const Duration(seconds: 1), () {
          aplicacaoStatus.value = AplicacaoStatus.initial;
        });
        return;
      }
    }

    final response = await addAplicacaoUseCase.call(novaAplicacao.value);

    response.either(
      (left) {
        debugPrint(left.toString());
        aplicacaoStatus.value = AplicacaoStatus.errorOnSave;
      },
      (right) {
        fetchAplicacoesState.call();
        aplicacaoStatus.value = AplicacaoStatus.successOnSave;
      },
    );

    await Future.delayed(const Duration(seconds: 1), () {
      aplicacaoStatus.value = AplicacaoStatus.initial;
    });
  }

  _removeAplicacao() async {
    aplicacaoLoading.value = true;
    final response = await removeAplicacaoUseCase.call(aplicacaoToRemove.value);

    response.either(
      (left) async {
        aplicacaoStatus.value = AplicacaoStatus.errorOnRemove;
        await Future.delayed(const Duration(seconds: 1), () {
          aplicacaoStatus.value = AplicacaoStatus.initial;
        });
        debugPrint(left.toString());
      },
      (right) {
        fetchAplicacoesState.call();
        aplicacaoStatus.value = AplicacaoStatus.successOnRemove;
        routes.pop();
      },
    );

    aplicacaoLoading.value = false;
  }
}
