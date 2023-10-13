import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/aplicacao/entity/aplicacao_entity.dart';
import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/feature/home/controllers/atoms/aplicacoes_atom.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/requisitos_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/sobre_empresa_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/sobre_vaga_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/vaga_info_widget.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VagaDetails extends StatelessWidget {
  const VagaDetails({required this.vaga, this.isEditing = false, super.key});

  final Vaga vaga;
  final bool isEditing;

  _snackBarSuccess(AplicacaoStatus status) {
    return SnackBar(
      content: TextComponent(
        text: status == AplicacaoStatus.successOnSave
            ? "Sucesso ao aplicar!"
            : "Sucesso ao remover aplicação",
        type: TextTypeComponent.statusText,
      ),
      backgroundColor: Colors.green,
    );
  }

  _snackBarOnError(AplicacaoStatus status) {
    return SnackBar(
      content: TextComponent(
        text: _chooseErrorText(status),
        type: TextTypeComponent.statusText,
      ),
      backgroundColor: Colors.red,
    );
  }

  _showSnackBar(AplicacaoStatus status, BuildContext context) {
    final SnackBar snackBar;

    switch (status) {
      case AplicacaoStatus.successOnSave || AplicacaoStatus.successOnRemove:
        snackBar = _snackBarSuccess(status);
      case AplicacaoStatus.errorOnSave ||
            AplicacaoStatus.aplicationAlreadyExists ||
            AplicacaoStatus.errorOnRemove:
        snackBar = _snackBarOnError(status);
      case AplicacaoStatus.initial || AplicacaoStatus.loading:
        return;
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return RxCallback(
      effects: [
        rxObserver(
          () => aplicacaoStatus.value,
          effect: (status) {
            _showSnackBar(status!, context);
          },
        )
      ],
      child: Scaffold(
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
              isEditing ? _buttonToRemoveAplicacao() : _buttonToAplicar(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonToAplicar(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _aplicar();
      },
      child: const Text("Aplicar"),
    );
  }

  Widget _buttonToRemoveAplicacao() {
    return ElevatedButton(
      onPressed: () => _removerAplicacao(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: const Text("Remover Aplicacao"),
    );
  }

  _aplicar() {
    novaAplicacao.value = Aplicacao(
      vagaNome: vaga.nome,
      id: vaga.id,
      empresaNome: vaga.nomeEmpresa,
    );
    addAplicacaoState.call();
  }

  _removerAplicacao() {
    aplicacaoToRemove.value = vaga.id;
    removeAplicacaoState.call();
  }

  String _chooseErrorText(AplicacaoStatus status) {
    if (status == AplicacaoStatus.errorOnSave) {
      return "Erro ao aplicar. Tente novamente mais tarde";
    }

    if (status == AplicacaoStatus.errorOnRemove) {
      return "Erro ao remover aplicação";
    }

    return "Você já aplicou nesta vaga";
  }
}
