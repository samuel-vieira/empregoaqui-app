import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/feature/home/widgets/aplicacoes_item_widget.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AplicacoesListWidget extends StatelessWidget {
  const AplicacoesListWidget({
    this.isEditing = false,
    super.key,
  });

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final loading = context.select(() => aplicacaoLoading.value);
    return loading
        ? const Center(child: CircularProgressIndicator())
        : _aplicacoesList(context);
  }

  Widget _aplicacoesList(BuildContext context) {
    final aplicacoes = context.select(() => aplicacoesAtom.value);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          itemCount:
              !isEditing && aplicacoes.length > 3 ? 3 : aplicacoes.length,
          itemBuilder: (context, index) => AplicacaoItemWidget(
            aplicacao: aplicacoes[index],
            isEditing: isEditing,
          ),
          shrinkWrap: true,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => context.go('/aplicacoes'),
          child: Align(
            alignment: Alignment.centerRight,
            child: Offstage(
              offstage: isEditing || aplicacoes.length <= 3,
              child: const TextComponent(
                text: 'Ver todas',
                type: TextTypeComponent.paragrafo2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
