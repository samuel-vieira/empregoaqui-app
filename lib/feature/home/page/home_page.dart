import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardComponent(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nome da empresa'),
            Text('Analista de Sistemas'),
          ],
        ),
      ),
    );
  }
}
