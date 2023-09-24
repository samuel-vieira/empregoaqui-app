import 'package:emprego_aqui_app/shared/text/custom_text_style.dart';
import 'package:flutter/widgets.dart';

enum TextTypeComponent {
  titulo,
  tituloCard,
  paragrafo1,
  paragrafo2,
}

class TextComponent extends StatelessWidget {
  const TextComponent({
    required this.text,
    required this.type,
    super.key,
  });

  final String text;
  final TextTypeComponent type;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _style(),
    );
  }

  TextStyle _style() {
    return switch (type) {
      TextTypeComponent.titulo => CustomTextStyle.titulo,
      TextTypeComponent.paragrafo1 => CustomTextStyle.paragrafo1,
      TextTypeComponent.paragrafo2 => CustomTextStyle.paragrafo2,
      TextTypeComponent.tituloCard => CustomTextStyle.tituloCard,
    };
  }
}
