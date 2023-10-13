import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/home/widgets/aplicacoes_list_widget.dart';
import 'package:emprego_aqui_app/feature/home/widgets/redirect_to_curriculo_widget.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RxBuilder(
              builder: (_) => TextComponent(
                text: userInfoAtom.value.username,
                type: TextTypeComponent.titulo,
              ),
            ),
            IconButton(
              onPressed: () {
                getIt<FirebaseService>().auth.signOut();
                context.go('/login');
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextComponent(
                text: 'Últimas Aplicações',
                type: TextTypeComponent.tituloCard,
              ),
              IconButton(
                onPressed: () => context.go('/aplicacoes'),
                icon: const Icon(Icons.edit),
              ),
            ],
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
