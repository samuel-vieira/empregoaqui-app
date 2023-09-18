import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';

// atom
final vagasAtom = <Vaga>[].asAtom();
final vagaLoading = Atom<bool>(false);

// actions
final fetchVagasState = Atom.action();
