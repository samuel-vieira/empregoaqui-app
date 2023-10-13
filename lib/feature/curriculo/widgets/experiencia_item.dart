import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExperienciaItem extends StatelessWidget {
  const ExperienciaItem({
    required this.experiencia,
    required this.isEditing,
    super.key,
  });

  final Experiencia experiencia;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      type: CardType.experienciaCard,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: isEditing
                ? () => context.go(
                      '/curriculo/experiencia/experiencia-form',
                      extra: {
                        'experiencia': experiencia,
                        'isEditing': isEditing
                      },
                    )
                : null,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 30.0,
                bottom: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const TextComponent(
                        text: 'Cargo: ',
                        type: TextTypeComponent.label,
                      ),
                      TextComponent(
                        text: experiencia.cargo,
                        type: TextTypeComponent.tituloCard,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const TextComponent(
                        text: 'Empresa: ',
                        type: TextTypeComponent.label,
                      ),
                      TextComponent(
                        text: experiencia.empresa,
                        type: TextTypeComponent.paragrafo2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const TextComponent(
                            text: 'Início: ',
                            type: TextTypeComponent.label,
                          ),
                          TextComponent(
                            text: experiencia.dataInicio,
                            type: TextTypeComponent.paragrafo2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const TextComponent(
                            text: 'Fim: ',
                            type: TextTypeComponent.label,
                          ),
                          TextComponent(
                            text: experiencia.dataFim,
                            type: TextTypeComponent.paragrafo2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextComponent(
                    text: 'Descrição: ',
                    type: TextTypeComponent.label,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextComponent(
                    text: experiencia.descricao,
                    type: TextTypeComponent.paragrafo2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isEditing,
            child: SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  experienciaIdAtom.value = experiencia.id;
                  removeExperienciasState.call();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Deletar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
