import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class SobreEmpresaWidget extends StatelessWidget {
  const SobreEmpresaWidget({required this.sobreEmpresa, super.key});

  final String sobreEmpresa;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextComponent(
          text: "Sobre a empresa",
          type: TextTypeComponent.paragrafo1,
        ),
        const SizedBox(
          height: 10,
        ),
        TextComponent(
          text: sobreEmpresa,
          type: TextTypeComponent.paragrafo3,
        ),
      ],
    );
  }
}
