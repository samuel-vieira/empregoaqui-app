import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AplicacaoItemWidget extends StatelessWidget {
  const AplicacaoItemWidget({
    required this.aplicacao,
    this.isEditing = false,
    super.key,
  });

  final Aplicacao aplicacao;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        vagaIdToFind.value = aplicacao.id;
        context.go('/vaga', extra: {'vaga': filteredVaga, 'isEditing': true});
      },
      child: CardComponent(
        type: CardType.homeCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComponent(
                    text: aplicacao.vagaNome,
                    type: TextTypeComponent.tituloCard,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextComponent(
                    text: aplicacao.empresaNome,
                    type: TextTypeComponent.label,
                  ),
                ],
              ),
              Visibility(
                visible: isEditing,
                child: IconButton(
                  onPressed: () => _removerAplicacao(),
                  icon: const Icon(Icons.close),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _removerAplicacao() {
    aplicacaoToRemove.value = aplicacao.id;
    removeAplicacaoState.call();
  }
}
