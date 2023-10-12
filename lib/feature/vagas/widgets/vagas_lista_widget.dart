import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/vaga_info_widget.dart';
import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VagasListaWidget extends StatefulWidget {
  const VagasListaWidget({super.key});

  @override
  State<VagasListaWidget> createState() => _VagasListaWidgetState();
}

class _VagasListaWidgetState extends State<VagasListaWidget> {
  @override
  Widget build(BuildContext context) {
    final vagas = context.select(() => filteredVagas);

    return vagaLoading.value
        ? const CircularProgressIndicator()
        : vagasList(vagas);
  }

  Widget vagasList(List<Vaga> vagas) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => context.go(
            '/vaga',
            extra: {
              'vaga': vagas[index],
              'isEditing': false,
            },
          ),
          child: CardComponent(
            type: CardType.vagaCard,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextComponent(
                    text: vagas[index].nome,
                    type: TextTypeComponent.tituloCard,
                  ),
                  VagaInfoWidget(vaga: vagas[index])
                ],
              ),
            ),
          ),
        );
      },
      itemCount: vagas.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
