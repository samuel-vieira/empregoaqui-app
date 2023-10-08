import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/competencia_item.dart';
import 'package:flutter/material.dart';

class CompetenciasList extends StatelessWidget {
  const CompetenciasList({
    this.isEditing = false,
    super.key,
  });

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final competencias = context.select(() => competenciasAtom.value);

    return ListView.builder(
      itemCount: competencias.length,
      itemBuilder: (context, index) => CompetenciaItem(
        competenciaNome: competencias[index].nome,
        competenciaTempo: '${competencias[index].tempo} anos',
        isEditing: isEditing,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
