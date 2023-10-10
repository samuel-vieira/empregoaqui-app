import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emprego_aqui_app/data/aplicacao/dto/aplicacao_dto.dart';
import 'package:emprego_aqui_app/data/curriculo/dto/experiencia_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseFirestore get db => FirebaseFirestore.instance;
  CollectionReference get vagasRef => db.collection("vagas");
  CollectionReference get curriculoRef => db.collection("curriculo");

  CollectionReference get experienciaRef => curriculoRef
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('experiencias')
      .withConverter<ExperienciaDTO>(
        fromFirestore: (snapshot, _) => ExperienciaDTO.fromFirestore(
          snapshot.data()!,
        ),
        toFirestore: (experienciaDTO, _) => experienciaDTO.toFirestore(),
      );

  CollectionReference get aplicacoesRef => db
      .collection("aplicacoes")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("aplicacoes")
      .withConverter<AplicacaoDTO>(
        fromFirestore: (snapshot, _) => AplicacaoDTO.fromFirestore(
          snapshot.data()!,
        ),
        toFirestore: (aplicacoesDTO, _) => aplicacoesDTO.toFirestore(),
      );

  FirebaseAuth get auth => FirebaseAuth.instance;
  Stream<User?> get authState => auth.authStateChanges();
}
