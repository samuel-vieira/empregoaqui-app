import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';

enum AplicacaoStatus {
  initial,
  loading,
  successOnSave,
  errorOnSave,
  aplicationAlreadyExists,
  successOnRemove,
  errorOnRemove,
}

// Atom
final aplicacoesAtom = <Aplicacao>[].asAtom();
final novaAplicacao = Atom<Aplicacao>(
  Aplicacao(
    vagaNome: '',
    id: '',
    empresaNome: '',
  ),
);
final aplicacaoToRemove = Atom<String>('');
final aplicacaoLoading = Atom<bool>(false);
final aplicacaoStatus = Atom<AplicacaoStatus>(AplicacaoStatus.initial);

// Reducer
final fetchAplicacoesState = Atom.action();
final addAplicacaoState = Atom.action();
final removeAplicacaoState = Atom.action();
