import 'package:emprego_aqui_app/feature/home/widgets/aplicacoes_list_widget.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:flutter/material.dart';

class AplicacoesPage extends StatelessWidget {
  const AplicacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarComponent(title: 'Aplicações'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: AplicacoesListWidget(
          isEditing: true,
        ),
      ),
    );
  }
}
