import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/data/aplicacao/di/injection.dart';
import 'package:emprego_aqui_app/data/curriculo/di/injection.dart';
import 'package:emprego_aqui_app/data/user/di/injection.dart';
import 'package:emprego_aqui_app/data/vagas/di/injection.dart';
import 'package:emprego_aqui_app/domain/aplicacao/di/injection.dart';
import 'package:emprego_aqui_app/domain/curriculo/di/injection.dart';
import 'package:emprego_aqui_app/domain/user/di/injection.dart';
import 'package:emprego_aqui_app/domain/vagas/di/injection.dart';
import 'package:emprego_aqui_app/firebase_options.dart';
import 'package:emprego_aqui_app/services/db/firebase_injector.dart';
import 'package:emprego_aqui_app/shared/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseInjector();
  VagasInjector();
  VagaDomainInjection();
  UserInjector();
  UserDomainInjector();
  CurriculoInjector();
  CurriculoDomainInjector();
  AplicacaoInjector();
  AplicacaoDomainInjector();

  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF45ADA8),
          onPrimary: Color(0xFFF9F9F9),
          secondary: Color(0xFF594F4F),
          onSecondary: Color(0xFFF9F9F9),
          error: Color(0xFFD73131),
          onError: Color(0xFFF9F9F9),
          background: Color(0xFFE1E1E1),
          onBackground: Color(0xFFF9F9F9),
          surface: Color(0xFFF2F2F2),
          onSurface: Color(0xFF45ADA8),
          primaryContainer: Color(0xFFE1E1E1),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFE1E1E1),
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Color(0xFF45ADA8),
              fontSize: 20,
            ),
            iconTheme: IconThemeData(
              color: Color(0xFF45ADA8),
            )),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFE1E1E1),
        ),
        scaffoldBackgroundColor: const Color(0xFFE1E1E1),
        cardTheme: const CardTheme(
          color: Color(0xFFF2F2F2),
        ),
      ),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
