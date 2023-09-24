import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';

// atom
final vagasAtom = <Vaga>[].asAtom();
final vagaLoading = Atom<bool>(false);
final vagaFieldTextState = Atom<String>('');

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

// actions
final fetchVagasState = Atom.action();
