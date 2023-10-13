import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class CompetenciaItem extends StatelessWidget {
  const CompetenciaItem({
    required this.competenciaNome,
    this.isEditing = false,
    super.key,
  });

  final String competenciaNome;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      type: CardType.homeCard,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextComponent(
              text: competenciaNome,
              type: TextTypeComponent.tituloCard,
            ),
            Visibility(
              visible: isEditing,
              child: IconButton(
                onPressed: () {
                  competenciaNomeAtom.value = competenciaNome;
                  removeCompetenciaState.call();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
