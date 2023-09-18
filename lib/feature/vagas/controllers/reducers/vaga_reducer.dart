import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/use_cases/get_vagas_usecase.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:flutter/material.dart';

class VagaReducer extends Reducer {
  final GetVagasUseCase getVagasUseCase;

  VagaReducer(this.getVagasUseCase) {
    on(() => [fetchVagasState.value], _fetchVagas);
  }

  void _fetchVagas() async {
    vagaLoading.value = true;

    final result = await getVagasUseCase.call();

    result.fold(
      (left) {
        debugPrint("Erro ao buscar vagas");
      },
      (right) {
        vagasAtom.value.addAll(right);
      },
    );

    vagaLoading.value = false;
  }
}
