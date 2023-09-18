import 'package:emprego_aqui_app/data/vagas/dto/vaga_dto.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:flutter/material.dart';

class VagasDataSource {
  const VagasDataSource(this.firebaseService);

  final FirebaseService firebaseService;

  Future<List<VagaDTO>> fetchVagas() async {
    try {
      final List<VagaDTO> vagasDTO = [];
      final encodedVagas = await firebaseService.vagasRef.get();

      for (var doc in encodedVagas.docs) {
        final vaga = VagaDTO.fromJson(doc);
        vagasDTO.add(vaga);
      }

      return vagasDTO;
    } catch (error) {
      throw "Erro ao pegar vagas";
    }
  }

  Future createVaga() async {
    try {
      final vaga = VagaDTO(nome: "Vaga 1 FB");
      final vaga1 = VagaDTO.toJson(vaga);
      firebaseService.vagasRef
          .doc(vaga1['nome'])
          .set(vaga1)
          .onError((error, _) => debugPrint("Erro ao adicionar vaga $error"));
    } catch (error) {
      throw "Erro ao criar vaga $error";
    }
  }
}
