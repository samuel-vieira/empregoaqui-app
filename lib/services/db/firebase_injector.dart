import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';

class FirebaseInjector {
  FirebaseInjector() {
    init();
  }

  init() {
    getIt.registerSingleton<FirebaseService>(FirebaseService());
  }
}
