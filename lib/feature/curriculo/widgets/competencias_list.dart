import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/competencia_item.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class CompetenciasList extends StatelessWidget {
  const CompetenciasList({
    this.isEditing = false,
    super.key,
  });

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      return competenciasAtom.value.isNotEmpty
          ? ListView.builder(
              itemCount: competenciasAtom.value.length,
              itemBuilder: (context, index) => CompetenciaItem(
                competenciaNome: competenciasAtom.value[index].nome,
                isEditing: isEditing,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            )
          : const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder_off),
                  SizedBox(
                    width: 10,
                  ),
                  TextComponent(
                    text: 'Sem competências',
                    type: TextTypeComponent.paragrafo2,
                  ),
                ],
              ),
            );
    });
  }
}
