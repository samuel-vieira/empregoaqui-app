import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class RequisitosWidget extends StatelessWidget {
  const RequisitosWidget({required this.requisitos, super.key});

  final List<String> requisitos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextComponent(
          text: "Requisitos",
          type: TextTypeComponent.paragrafo1,
        ),
        const SizedBox(
          height: 10,
        ),
        for (String requisito in requisitos)
          TextComponent(
            text: '• $requisito',
            type: TextTypeComponent.paragrafo2,
          ),
      ],
    );
  }
}
