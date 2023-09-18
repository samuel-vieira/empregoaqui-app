import 'package:emprego_aqui_app/feature/vagas/widgets/vagas_lista_widget.dart';
import 'package:flutter/material.dart';

class VagasPage extends StatelessWidget {
  const VagasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VagasListaWidget(),
      ],
    );
  }
}
