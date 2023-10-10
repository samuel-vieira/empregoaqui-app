import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';

// Atom
final aplicacoesAtom = <Aplicacao>[].asAtom();
final novaAplicacao = Atom<Aplicacao>(Aplicacao(vagaNome: '', id: ''));
final aplicacaoToRemove = Atom<String>('');

// Reducer
final fetchAplicacoesState = Atom.action();
final addAplicacaoState = Atom.action();
final removeAplicacaoState = Atom.action();
