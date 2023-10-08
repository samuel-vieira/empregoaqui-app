import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/curriculo_entity.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';

// Atoms
final curriculoAtom = Atom<Curriculo?>(null);
final competenciasAtom = <Competencia>[].asAtom();
final experienciasAtom = <Experiencia>[].asAtom();
final curriculoLoadingState = Atom<bool>(false);
final competenciaNomeAtom = Atom<String>('');
final novaCompetencia = Atom<Competencia>(Competencia(nome: '', tempo: ''));
final experienciaNomeAtom = Atom<String>('');
final novaExperienciaAtom = Atom<Experiencia>(
  Experiencia(
    empresa: '',
    descricao: '',
    cargo: '',
    dataInicio: '',
    dataFim: '',
  ),
);

// Actions
final fetchCurriculoState = Atom.action();
final fetchCompetenciasState = Atom.action();
final addCompetenciaState = Atom.action();
final removeCompetenciaState = Atom.action();
final fetchExperienciasState = Atom.action();
final addExperienciasState = Atom.action();
final removeExperienciasState = Atom.action();
