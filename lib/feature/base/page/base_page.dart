import 'package:emprego_aqui_app/feature/home/page/home_page.dart';
import 'package:emprego_aqui_app/feature/vagas/page/vagas_page.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_item.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final List<AppBarItem> widgetOptions = [
    AppBarItem(const HomePage(), 'Home'),
    AppBarItem(const VagasPage(), 'Vagas'),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: widgetOptions.elementAt(_currentIndex).title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: widgetOptions.elementAt(_currentIndex).widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Vagas',
          ),
        ],
      ),
    );
  }
}
