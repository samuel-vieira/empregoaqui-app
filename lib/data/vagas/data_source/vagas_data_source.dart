import 'package:emprego_aqui_app/data/vagas/dto/vaga_dto.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:emprego_aqui_app/shared/generate_uuid.dart';
import 'package:flutter/material.dart';

class VagasDataSource {
  const VagasDataSource(this.firebaseService);

  final FirebaseService firebaseService;

  Future<List<VagaDTO>> fetchVagas() async {
    try {
      final List<VagaDTO> vagasDTO = [];
      final encodedVagas = await firebaseService.vagasRef.get();

      for (var doc in encodedVagas.docs) {
        final vaga = VagaDTO.fromFirestore(doc);
        vagasDTO.add(vaga);
      }

      return vagasDTO;
    } catch (error) {
      throw "Erro ao pegar vagas";
    }
  }

  Future<VagaDTO> fetchVaga(String id) async {
    try {
      final encodedVaga = await firebaseService.vagasRef.doc(id).get();

      final vagaDTO = VagaDTO.fromFirestore(encodedVaga.data());

      return vagaDTO;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future createVaga() async {
    try {
      final vaga = VagaDTO(
        nome: "Desenvolvedor Java",
        nomeEmpresa: "Rec solutions",
        sobreEmpresa:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        sobreVaga:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        requistos: [
          "Java",
          "Spring Boot",
          "Postgres SQL",
          "Git",
        ],
        modeloTrabalho: "Remoto",
        salario: "18000",
        tipoDeContrato: "PJ",
      );
      final vaga1 = VagaDTO.toJson(vaga);

      final uuid = UniqueId().generateUuid();

      firebaseService.vagasRef
          .doc(uuid)
          .set(vaga1)
          .onError((error, _) => debugPrint("Erro ao adicionar vaga $error"));
    } catch (error) {
      throw "Erro ao criar vaga $error";
    }
  }
}
