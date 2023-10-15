import 'package:emprego_aqui_app/feature/curriculo/widgets/experiencia_list.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExperienciasPage extends StatelessWidget {
  const ExperienciasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(title: 'Experiências'),
      body: const Padding(
        padding: EdgeInsets.only(
          bottom: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: ExperienciaList(
          isEditing: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/curriculo/experiencia/experiencia-form'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
