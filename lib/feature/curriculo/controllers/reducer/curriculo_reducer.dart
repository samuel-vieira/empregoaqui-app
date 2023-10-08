import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/add_competencias_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/add_experiencia_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/get_competencias_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/get_curriculo_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/get_experiencias_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/remove_competencia_use_case.dart';
import 'package:emprego_aqui_app/domain/curriculo/use_cases/remove_experiencia_use_case.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:flutter/material.dart';

class CurriculoReducer extends Reducer {
  final GetCurriculoUseCase getCurriculoUseCase;
  final AddCompetenciasUseCase addCompetenciasUseCase;
  final GetCompetenciasUseCase getCompetenciasUseCase;
  final RemoveCompetenciaUseCase removeCompetenciaUseCase;
  final GetExperienciasUseCase getExperienciasUseCase;
  final AddExperienciaUseCase addExperienciaUseCase;
  final RemoveExperienciaUseCase removeExperienciaUseCase;

  CurriculoReducer({
    required this.getCurriculoUseCase,
    required this.addCompetenciasUseCase,
    required this.getCompetenciasUseCase,
    required this.removeCompetenciaUseCase,
    required this.getExperienciasUseCase,
    required this.addExperienciaUseCase,
    required this.removeExperienciaUseCase,
  }) {
    on(() => [fetchCurriculoState.value], _fetchCurriculo);
    on(() => [fetchCompetenciasState.value], _fetchCompetencias);
    on(() => [addCompetenciaState.value], _addCompetencia);
    on(() => [removeCompetenciaState.value], _removeCompetencia);
    on(() => [fetchExperienciasState.value], _fetchExperiencias);
    on(() => [addExperienciasState.value], _addExperiencia);
    on(() => [removeExperienciasState.value], _removeExperiencia);
  }

  _fetchCurriculo() async {
    curriculoLoadingState.value = true;

    fetchCompetenciasState.call();
    fetchExperienciasState.call();

    curriculoLoadingState.value = false;
  }

  _fetchCompetencias() async {
    final response = await getCompetenciasUseCase.call();

    response.either(
      (left) => null,
      (right) {
        competenciasAtom.value.clear();

        for (var competencia in right) {
          competenciasAtom.value.add(competencia);
        }
      },
    );
  }

  _addCompetencia() async {
    if (competenciasAtom.value.contains(novaCompetencia.value)) {
      return;
    }

    final response = await addCompetenciasUseCase.call(novaCompetencia.value);

    response.either(
      (left) {
        debugPrint(left.toString());

        return false;
      },
      (right) {
        fetchCompetenciasState.call();

        return true;
      },
    );
  }

  _removeCompetencia() async {
    final response =
        await removeCompetenciaUseCase.call(competenciaNomeAtom.value);

    response.either(
      (left) => debugPrint(left.toString()),
      (right) => fetchCompetenciasState.call(),
    );
  }

  _fetchExperiencias() async {
    final response = await getExperienciasUseCase.call();

    response.either(
      (left) => debugPrint(left.toString()),
      (right) {
        experienciasAtom.value.clear();

        for (var experiencia in right) {
          experienciasAtom.value.add(experiencia);
        }
      },
    );
  }

  _addExperiencia() async {
    var response = await addExperienciaUseCase.call(novaExperienciaAtom.value);

    response.either(
      (left) => debugPrint('teste'),
      (right) {
        fetchExperienciasState.call();
      },
    );
  }

  _removeExperiencia() async {
    debugPrint('Delete chamado');
    var response =
        await removeExperienciaUseCase.call(experienciaNomeAtom.value);

    response.either(
      (left) => debugPrint(left.toString()),
      (right) => fetchExperienciasState.call(),
    );
  }
}
