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
    return RxBuilder(builder: (_) {
      return aplicacaoLoading.value
          ? const Center(child: CircularProgressIndicator())
          : aplicacoesAtom.value.isNotEmpty
              ? _aplicacoesList(context)
              : const ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_off),
                      SizedBox(
                        width: 10,
                      ),
                      TextComponent(
                        text: 'Sem aplicações',
                        type: TextTypeComponent.paragrafo2,
                      ),
                    ],
                  ),
                );
    });
  }

  Widget _aplicacoesList(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          itemCount: !isEditing && aplicacoesAtom.value.length > 3
              ? 3
              : aplicacoesAtom.value.length,
          itemBuilder: (context, index) => AplicacaoItemWidget(
            aplicacao: aplicacoesAtom.value[index],
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
              offstage: isEditing || aplicacoesAtom.value.length <= 3,
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
