import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/user_atom.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class DadosPessoaisWidget extends StatefulWidget {
  const DadosPessoaisWidget({super.key});

  @override
  State<DadosPessoaisWidget> createState() => _DadosPessoaisWidgetState();
}

class _DadosPessoaisWidgetState extends State<DadosPessoaisWidget> {
  @override
  void initState() {
    super.initState();
    fetchUserState.call();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select(() => userInfoAtom.value);

    return Column(
      children: [
        Row(
          children: [
            const TextComponent(
              text: 'Nome: ',
              type: TextTypeComponent.label,
            ),
            _dadosPessoaisText(user.username),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const TextComponent(
              text: 'Email: ',
              type: TextTypeComponent.label,
            ),
            _dadosPessoaisText(user.email),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const TextComponent(
              text: 'Telefone: ',
              type: TextTypeComponent.label,
            ),
            _dadosPessoaisText(user.telefone),
          ],
        ),
      ],
    );
  }

  Widget _dadosPessoaisText(String text) {
    return TextComponent(
      text: text,
      type: TextTypeComponent.paragrafo2,
    );
  }
}
