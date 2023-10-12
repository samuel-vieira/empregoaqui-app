import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/home_atom.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';

class HomeReducer extends Reducer {
  HomeReducer() {
    on(() => [fetchSetupDataState], _fetchSetupData);
  }

  _fetchSetupData() {
    fetchUserInfoState.call();
    fetchAplicacoesState.call();
    fetchVagasState.call();
  }
}
