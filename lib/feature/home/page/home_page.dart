import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/feature/home/widgets/aplicacoes_list_widget.dart';
import 'package:emprego_aqui_app/feature/home/widgets/redirect_to_curriculo_widget.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchAplicacoesState.call();
  }

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
        const AplicacoesListWidget(),
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
