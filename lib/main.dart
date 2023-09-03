import 'package:emprego_aqui_app/feature/base/base_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BasePage(),
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
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF45ADA8),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
