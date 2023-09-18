import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseFirestore get db => FirebaseFirestore.instance;
  CollectionReference get vagasRef => db.collection("vagas");
}
