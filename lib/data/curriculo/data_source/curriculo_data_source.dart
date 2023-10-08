import 'package:emprego_aqui_app/data/curriculo/dto/competencia_dto.dart';
import 'package:emprego_aqui_app/data/curriculo/dto/curriculo_dto.dart';
import 'package:emprego_aqui_app/data/curriculo/dto/experiencia_dto.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:flutter/material.dart';

class CurriculoDataSource {
  CurriculoDataSource({required this.firebaseService});

  final FirebaseService firebaseService;

  Future<CurriculoDTO> fetchCurriculo() async {
    try {
      String userId = firebaseService.auth.currentUser!.uid;

      final encodedCurriculo =
          await firebaseService.curriculoRef.doc(userId).get();

      CurriculoDTO curriculoDTO = CurriculoDTO.fromFirestore(encodedCurriculo);

      return curriculoDTO;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future<List<CompetenciaDTO>> fetchCompetencias() async {
    try {
      String userId = firebaseService.auth.currentUser!.uid;
      List<CompetenciaDTO> competenciasDTO = [];

      final encodedCompetencias = await firebaseService.curriculoRef
          .doc(userId)
          .collection('competencias')
          .get();

      for (var doc in encodedCompetencias.docs) {
        final data = doc.data();
        final competenciaDTO = CompetenciaDTO(
          nome: data['nome'],
          tempo: data['tempo'],
        );
        competenciasDTO.add(competenciaDTO);
      }

      return competenciasDTO;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future addCompetencia(CompetenciaDTO competenciaDTO) async {
    try {
      Map<String, dynamic> competenciaMap = {
        "nome": competenciaDTO.nome,
        "tempo": competenciaDTO.tempo,
      };

      // Alterar para valores dinamicos
      firebaseService.curriculoRef
          .doc(firebaseService.auth.currentUser!.uid)
          .collection("competencias")
          .doc(competenciaMap['nome'])
          .set(competenciaMap)
          .onError((error, stackTrace) => debugPrint(error.toString()));
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future deleteCompetencia(String competenciaNome) async {
    try {
      firebaseService.curriculoRef
          .doc(firebaseService.auth.currentUser!.uid)
          .collection("competencias")
          .doc(competenciaNome)
          .delete()
          .onError((error, stackTrace) => debugPrint(error.toString()));
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ExperienciaDTO>> fetchExperiencias() async {
    try {
      List<ExperienciaDTO> experiencias = [];

      final encodedExperiencias =
          await firebaseService.experienciaRef.get().then(
                (snapshot) => snapshot.docs,
              );

      for (var encodedExperiencia in encodedExperiencias) {
        ExperienciaDTO experienciaDTO =
            encodedExperiencia.data() as ExperienciaDTO;
        experiencias.add(experienciaDTO);
      }

      return experiencias;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future addExperiencia(ExperienciaDTO experienciaDTO) async {
    try {
      firebaseService.experienciaRef
          .doc(experienciaDTO.cargo)
          .set(experienciaDTO)
          .onError((error, stackTrace) => debugPrint(error.toString()));
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future deleteExperiencia(String experienciaNome) async {
    try {
      firebaseService.experienciaRef
          .doc(experienciaNome)
          .delete()
          .onError((error, stackTrace) => debugPrint(error.toString()));
    } catch (error) {
      rethrow;
    }
  }
}
