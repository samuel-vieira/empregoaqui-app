import 'package:asp/asp.dart';
import 'package:firebase_auth/firebase_auth.dart';

// atom
final user = Atom<User?>(null);
final username = Atom<String>('');
final password = Atom<String>('');

//actions
final signInAction = Atom.action();
