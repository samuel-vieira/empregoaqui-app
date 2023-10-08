import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class SobreVagaWidget extends StatelessWidget {
  const SobreVagaWidget({required this.sobreVaga, super.key});

  final String sobreVaga;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextComponent(
          text: "Sobre a vaga",
          type: TextTypeComponent.paragrafo1,
        ),
        const SizedBox(
          height: 10,
        ),
        TextComponent(
          text: sobreVaga,
          type: TextTypeComponent.paragrafo3,
        ),
      ],
    );
  }
}
