import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/dados_pessoais_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/user_atom.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserReducer extends Reducer {
  UserReducer() {
    on(() => [fetchUserState.value], _fetchUser);
    on(() => [updateUserState.value], _updateUser);
  }

  _fetchUser() {
    final user = FirebaseAuth.instance.currentUser!;

    final DadosPessoais dadosPessoais = DadosPessoais(
      nome: user.displayName ?? '',
      email: user.email ?? '',
    );

    userAtom.value = dadosPessoais;
  }

  _updateUser() async {
    final User user = FirebaseAuth.instance.currentUser!;

    if (user.displayName != nomeTextFieldAtom.value) {
      await user.updateDisplayName(nomeTextFieldAtom.value);
    }

    if (user.email != emailTextFieldAtom.value) {
      await user.updateEmail(emailTextFieldAtom.value);
    }

    fetchUserState.call();
  }
}
