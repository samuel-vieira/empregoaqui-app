import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/use_cases/get_vaga_use_case.dart';
import 'package:emprego_aqui_app/domain/vagas/use_cases/get_vagas_usecase.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:flutter/material.dart';

class VagaReducer extends Reducer {
  final GetVagasUseCase getVagasUseCase;
  final GetVagaUseCase getVagaUseCase;

  VagaReducer({
    required this.getVagasUseCase,
    required this.getVagaUseCase,
  }) {
    on(() => [fetchVagasState], _fetchVagas);
    on(() => [fetchVagaState], _fetchVaga);
  }

  void _fetchVagas() async {
    vagaLoading.value = true;

    final result = await getVagasUseCase.call();

    result.fold(
      (left) => debugPrint("Erro ao buscar vagas: $left"),
      (right) {
        vagasAtom.value.clear();
        vagasAtom.value.addAll(right);
      },
    );

    vagaLoading.value = false;
  }

  void _fetchVaga() async {
    final result = await getVagaUseCase.call(vagaIdToGet.value);

    result.either(
      (left) => debugPrint(left.toString()),
      (right) => vagaAtom.value = right,
    );
  }
}
