import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class VagaInfoWidget extends StatelessWidget {
  const VagaInfoWidget({required this.vaga, super.key});

  final Vaga vaga;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.work_outline,
                  size: 15,
                  color: Color(0xff45ADA8),
                ),
                const SizedBox(
                  width: 5,
                ),
                TextComponent(
                  text: vaga.tipoDeContrato,
                  type: TextTypeComponent.paragrafo3,
                ),
              ],
            ),
            Row(
              children: [
                vaga.modeloDeTrabalho.toLowerCase() == 'presencial'
                    ? const Icon(
                        Icons.business,
                        size: 15,
                        color: Color(0xff45ADA8),
                      )
                    : const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Color(0xff45ADA8),
                      ),
                const SizedBox(
                  width: 5,
                ),
                TextComponent(
                  text: vaga.modeloDeTrabalho,
                  type: TextTypeComponent.paragrafo3,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.attach_money_outlined,
                  size: 15,
                  color: Color(0xff45ADA8),
                ),
                TextComponent(
                  text: vaga.salario,
                  type: TextTypeComponent.paragrafo3,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
