import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AplicacaoItemWidget extends StatelessWidget {
  const AplicacaoItemWidget({
    required this.aplicacao,
    super.key,
  });

  final Aplicacao aplicacao;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        vagaIdToFind.value = aplicacao.id;
        debugPrint(filteredVaga.toString());
        context.go('/vaga', extra: {'vaga': filteredVaga, 'isEditing': true});
      },
      child: CardComponent(
        type: CardType.homeCard,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponent(
                text: aplicacao.vagaNome,
                type: TextTypeComponent.tituloCard,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
