import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class NomeWidget extends StatelessWidget {
  const NomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(
            text: 'Emprego',
            type: TextTypeComponent.nomeLogin1,
          ),
          TextComponent(
            text: 'Aqui',
            type: TextTypeComponent.nomeLogin2,
          ),
        ],
      ),
    );
  }
}
