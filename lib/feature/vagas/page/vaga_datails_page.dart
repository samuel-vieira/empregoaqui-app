import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/requisitos_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/sobre_empresa_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/sobre_vaga_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/vaga_info_widget.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VagaDetails extends StatelessWidget {
  const VagaDetails({required this.vaga, super.key});

  final Vaga vaga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: vaga.nome,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: TextComponent(
                text: vaga.nomeEmpresa,
                type: TextTypeComponent.titulo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            VagaInfoWidget(
              vaga: vaga,
            ),
            const SizedBox(
              height: 20,
            ),
            SobreEmpresaWidget(
              sobreEmpresa: vaga.sobreEmpresa,
            ),
            const SizedBox(
              height: 10,
            ),
            SobreVagaWidget(sobreVaga: vaga.sobreVaga),
            const SizedBox(
              height: 20,
            ),
            RequisitosWidget(requisitos: vaga.requisitos),
            ElevatedButton(
              onPressed: _aplicar,
              child: const Text("Aplicar"),
            ),
          ],
        ),
      ),
    );
  }

  _aplicar() {}
}
