import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/experiencia_form_widget.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class ExperienciaFormPage extends StatelessWidget {
  const ExperienciaFormPage({
    this.experiencia,
    this.isEditing = false,
    super.key,
  });

  final Experiencia? experiencia;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return RxCallback(
      effects: [
        rxObserver(() => errorOnAddExperiencia.value, effect: (hasError) {
          final snackBar = SnackBar(
            content: TextComponent(
              text: hasError != null && hasError == true
                  ? 'Erro ao atualizar vaga'
                  : 'Sucesso ao atualizar vaga',
              type: TextTypeComponent.statusText,
            ),
            backgroundColor: hasError != null && hasError == true
                ? Colors.red
                : Colors.green,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        })
      ],
      child: ExperienciaFormWidget(
        isEditing: isEditing,
        experiencia: experiencia,
      ),
    );
  }
}
