import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/experiencia_item.dart';
import 'package:flutter/material.dart';

class ExperienciaList extends StatelessWidget {
  const ExperienciaList({
    required this.isEditing,
    super.key,
  });

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final experiencias = context.select(() => experienciasAtom.value);

    /*return experiencias.isNotEmpty
        ? ListView.builder(
            itemCount: experiencias.length,
            itemBuilder: (context, index) => ExperienciaItem(
              experienciaNome: experiencias[index].empresa,
              isEditing: isEditing,
            ),
            shrinkWrap: true,
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
                  text: 'Sem experiência',
                  type: TextTypeComponent.paragrafo2,
                ),
              ],
            ),
          );*/
    return ListView.builder(
      itemCount: experiencias.length,
      itemBuilder: (context, index) => ExperienciaItem(
        experiencia: experiencias[index],
        isEditing: isEditing,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
