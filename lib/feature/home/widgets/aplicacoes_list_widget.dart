import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/feature/home/widgets/aplicacoes_item_widget.dart';
import 'package:flutter/material.dart';

class AplicacoesListWidget extends StatelessWidget {
  const AplicacoesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final aplicacoes = context.select(() => aplicacoesAtom.value);

    return ListView.builder(
      itemCount: aplicacoes.length,
      itemBuilder: (context, index) => AplicacaoItemWidget(
        aplicacao: aplicacoes[index],
      ),
      shrinkWrap: true,
    );
  }
}
