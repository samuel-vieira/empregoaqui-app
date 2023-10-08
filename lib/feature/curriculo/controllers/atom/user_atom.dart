import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/dados_pessoais_entity.dart';

// Atom
final userAtom = Atom<DadosPessoais>(DadosPessoais(nome: '', email: ''));
final nomeTextFieldAtom = Atom<String>('');
final emailTextFieldAtom = Atom<String>('');

// Actions
final fetchUserState = Atom.action();
final updateUserState = Atom.action();
