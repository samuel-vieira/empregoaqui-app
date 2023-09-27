import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseFirestore get db => FirebaseFirestore.instance;
  CollectionReference get vagasRef => db.collection("vagas");

  FirebaseAuth get auth => FirebaseAuth.instance;
  Stream<User?> get authState => auth.authStateChanges();
}
