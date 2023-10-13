import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/curriculo_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/competencias_list.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/dados_pessoais_widget.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/experiencia_list.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurriculoPage extends StatefulWidget {
  const CurriculoPage({super.key});

  @override
  State<CurriculoPage> createState() => _CurriculoPageState();
}

class _CurriculoPageState extends State<CurriculoPage> {
  @override
  void initState() {
    super.initState();
    fetchCurriculoState.call();
  }

  @override
  Widget build(BuildContext context) {
    final curriculo = context.select(() => curriculoAtom.value);
    final curriculoLoading = context.select(() => curriculoLoadingState.value);

    return Scaffold(
      appBar: const AppBarComponent(title: 'Curriculo'),
      body: curriculoLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: curriculoWidget(curriculo),
            ),
    );
  }

  Widget curriculoWidget(Curriculo? curriculo) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextComponent(
              text: 'Dados Pessoais',
              type: TextTypeComponent.titulo,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.go('/curriculo/dados-pessoais'),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const DadosPessoaisWidget(),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextComponent(
              text: 'Experiência',
              type: TextTypeComponent.titulo,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.go('/curriculo/experiencia'),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const ExperienciaList(
          isEditing: false,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextComponent(
              text: 'Competências',
              type: TextTypeComponent.titulo,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.go('/curriculo/competencias'),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const CompetenciasList(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
