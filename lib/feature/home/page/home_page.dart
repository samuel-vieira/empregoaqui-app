import 'package:emprego_aqui_app/feature/home/widgets/redirect_to_curriculo_widget.dart';
import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextComponent(
              text: FirebaseAuth.instance.currentUser!.displayName ??
                  FirebaseAuth.instance.currentUser!.email!,
              type: TextTypeComponent.paragrafo1,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: TextComponent(
            text: 'Últimas Aplicações',
            type: TextTypeComponent.tituloCard,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CardComponent(
          type: CardType.homeCard,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nome da empresa'),
                Text('Analista de Sistemas'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Color(0xFF45ADA8),
        ),
        const SizedBox(
          height: 20,
        ),
        const RedirectToCurriculo(),
      ],
    );
  }
}
