import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/user/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

// atom
final user = Atom<User?>(null);
final email = Atom<String>('');
final password = Atom<String>('');

final userInfoAtom = Atom<UserEntity>(
  UserEntity(
    username: '',
    email: '',
    telefone: '',
  ),
);
final userDataToUpdate = Atom<Map<String, dynamic>>({});

//actions
final signInState = Atom.action();
final fetchUserInfoState = Atom.action();
final updateUserInfoState = Atom.action();
