import 'package:emprego_aqui_app/data/aplicacao/dto/aplicacao_dto.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:flutter/material.dart';

class AplicacaoDataSource {
  AplicacaoDataSource(this.firebaseService);

  final FirebaseService firebaseService;

  Future<List<AplicacaoDTO>> fetchAplicacoes() async {
    try {
      List<AplicacaoDTO> aplicacaoDTO = [];
      final encodedAplicacoes = await firebaseService.aplicacoesRef
          .get()
          .then((snapshot) => snapshot.docs);

      for (var encodedAplicacao in encodedAplicacoes) {
        final aplicacao = encodedAplicacao.data() as AplicacaoDTO;
        aplicacaoDTO.add(aplicacao);
      }

      return aplicacaoDTO;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future addAplicacao(AplicacaoDTO aplicacaoDTO) async {
    try {
      await firebaseService.aplicacoesRef
          .doc(aplicacaoDTO.idVaga)
          .set(aplicacaoDTO);
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future removeAplicacao(String id) async {
    try {
      await firebaseService.aplicacoesRef.doc(id).delete();
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
