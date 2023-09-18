import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:flutter/material.dart';

class VagasListaWidget extends StatefulWidget {
  const VagasListaWidget({super.key});

  @override
  State<VagasListaWidget> createState() => _VagasListaWidgetState();
}

class _VagasListaWidgetState extends State<VagasListaWidget> {
  @override
  void initState() {
    super.initState();
    fetchVagasState.call();
  }

  @override
  Widget build(BuildContext context) {
    final vagas = context.select(() => vagasAtom.value);

    return vagaLoading.value
        ? const CircularProgressIndicator()
        : vagasList(vagas);
  }

  Widget vagasList(List<Vaga> vagas) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 40,
          width: 200,
          child: Text(vagas[index].nome),
        );
      },
      itemCount: vagas.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
