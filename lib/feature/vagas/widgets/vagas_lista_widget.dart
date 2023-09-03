import 'package:flutter/material.dart';

class VagasListaWidget extends StatelessWidget {
  const VagasListaWidget({super.key});

  final List vagas = const ["Vaga 1", "Vaga 2"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 40,
          width: 200,
          child: Text(vagas[index]),
        );
      },
      itemCount: vagas.length,
    );
  }
}
