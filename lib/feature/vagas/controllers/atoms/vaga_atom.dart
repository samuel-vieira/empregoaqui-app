import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';

// atom
final vagasAtom = <Vaga>[].asAtom();
final vagaLoading = Atom<bool>(false);
final vagaFieldTextState = Atom<String>('');
final vagaIdToFind = Atom<String>('');
final vagaIdToGet = Atom<String>('');
final vagaAtom = Atom<Vaga>(
  Vaga(
    nome: '',
    principalTecnologia: '',
    modeloDeTrabalho: '',
    nomeEmpresa: '',
    tipoDeContrato: '',
    salario: '',
    sobreVaga: '',
    sobreEmpresa: '',
    requisitos: [],
    id: '',
  ),
);

//computed
List<Vaga> get filteredVagas {
  if (vagaFieldTextState.value.isEmpty) {
    return vagasAtom.value;
  }

  return vagasAtom
      .where((vaga) => vaga.nome
          .toLowerCase()
          .contains(vagaFieldTextState.value.toLowerCase()))
      .toList();
}

Vaga? get filteredVaga {
  return vagasAtom.where((vaga) => vaga.id == vagaIdToFind.value).first;
}

// actions
final fetchVagasState = Atom.action();
final fetchVagaState = Atom.action();
