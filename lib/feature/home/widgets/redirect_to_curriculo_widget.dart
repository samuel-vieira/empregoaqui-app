import 'package:emprego_aqui_app/shared/card/card_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectToCurriculo extends StatelessWidget {
  const RedirectToCurriculo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/curriculo'),
      child: const CardComponent(
        type: CardType.homeCard,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(
                text: 'Curriculo',
                type: TextTypeComponent.tituloCard,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF45ADA8),
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
