import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/experiencia_item.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class ExperienciaList extends StatelessWidget {
  const ExperienciaList({
    required this.isEditing,
    super.key,
  });

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      return experienciasAtom.value.isNotEmpty
          ? ListView.builder(
              itemCount: experienciasAtom.value.length,
              itemBuilder: (context, index) => ExperienciaItem(
                experiencia: experienciasAtom.value[index],
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
                    text: 'Sem experiência',
                    type: TextTypeComponent.paragrafo2,
                  ),
                ],
              ),
            );
    });
  }
}
