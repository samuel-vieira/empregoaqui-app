import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';

class ExperienciaFormWidget extends StatefulWidget {
  const ExperienciaFormWidget({
    this.experiencia,
    this.isEditing = false,
    super.key,
  });

  final Experiencia? experiencia;
  final bool isEditing;

  @override
  State<ExperienciaFormWidget> createState() => _ExperienciaFormWidgetState();
}

class _ExperienciaFormWidgetState extends State<ExperienciaFormWidget> {
  final GlobalKey<FormState> key = GlobalKey();

  final DateTime data = DateTime.now();

  final _meses = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  final _anos = [
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
  ];

  String dropMesInicioValue = '01';

  String dropAnoInicioValue = '2000';

  String dropMesFimValue = '01';

  String dropAnoFimValue = '2000';

  TextEditingController cargoController = TextEditingController();

  final empresaController = TextEditingController();

  final descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.experiencia != null) {
      cargoController.text = widget.experiencia!.cargo;
      empresaController.text = widget.experiencia!.empresa;
      descricaoController.text = widget.experiencia!.descricao;
      final dataInicio = widget.experiencia!.dataInicio.split('/');
      final dataFim = widget.experiencia!.dataFim.split('/');
      dropMesInicioValue = dataInicio[0];
      dropAnoInicioValue = dataInicio[1];
      dropMesFimValue = dataFim[0];
      dropAnoFimValue = dataFim[1];
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarComponent(title: 'Experiência'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: cargoController,
                    decoration: decoration('Cargo'),
                    maxLength: 40,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Campo não pode estar vazio';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: empresaController,
                    decoration: decoration('Empresa'),
                    maxLength: 40,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Campo não pode estar vazio';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextComponent(
                    text: 'Data Início',
                    type: TextTypeComponent.paragrafo2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          items: _meses.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              dropMesInicioValue = value.toString(),
                          value: dropMesInicioValue,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: _anos.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              dropAnoInicioValue = value.toString(),
                          value: dropAnoInicioValue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextComponent(
                    text: 'Data Fim',
                    type: TextTypeComponent.paragrafo2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          items: _meses.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              dropMesFimValue = value.toString(),
                          value: dropMesFimValue,
                          validator: (value) {
                            if (value != null &&
                                int.parse(value) > data.month &&
                                int.parse(dropAnoFimValue) == data.year) {
                              return 'Data inválida';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: _anos.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              dropAnoFimValue = value.toString(),
                          value: dropAnoFimValue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: descricaoController,
                    decoration: decoration('Descrição'),
                    maxLength: 300,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Campo não pode estar vazio';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => widget.isEditing
                      ? _updateExperiencia()
                      : _addExperiencia(),
                  child: const Text('Salvar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String hint) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      hintText: hint,
    );
  }

  _addExperiencia() async {
    if (!key.currentState!.validate()) {
      _isValid();
      return;
    }

    novaExperienciaAtom.value = Experiencia(
      empresa: empresaController.value.text,
      descricao: descricaoController.value.text,
      cargo: cargoController.value.text,
      dataInicio: '$dropMesInicioValue/$dropAnoInicioValue',
      dataFim: '$dropMesFimValue/$dropAnoFimValue',
      id: '',
    );

    addExperienciasState.call();
  }

  _updateExperiencia() async {
    if (!key.currentState!.validate()) {
      _isValid();
      return;
    }

    Map<String, dynamic> experienciaMap = {};

    if (cargoController.value.text != widget.experiencia!.cargo) {
      experienciaMap.addAll({'cargo': cargoController.value.text});
    }

    if (empresaController.value.text != widget.experiencia!.empresa) {
      experienciaMap.addAll({'empresa': empresaController.value.text});
    }

    final String dataInicio = '$dropMesInicioValue/$dropAnoInicioValue';
    if (dataInicio != widget.experiencia!.dataInicio) {
      experienciaMap.addAll({'tempoInicio': dataInicio});
    }

    final String dataFim = '$dropMesFimValue/$dropAnoFimValue';
    if (dataFim != widget.experiencia!.dataFim) {
      experienciaMap.addAll({'tempoFim': dataFim});
    }

    if (descricaoController.value.text != widget.experiencia!.descricao) {
      experienciaMap.addAll({'descricao': descricaoController.value.text});
    }

    if (experienciaMap.isEmpty) {
      const snackBar = SnackBar(
        content: Column(
          children: [
            TextComponent(
              text: "Não houve mudança dos valores anteriores",
              type: TextTypeComponent.statusText,
            ),
            TextComponent(
              text: "Altere dados no formulário",
              type: TextTypeComponent.statusText,
            ),
          ],
        ),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      experienciaMap.addAll({'id': widget.experiencia!.id});
      experienciaToUpdate.value = experienciaMap;
      updateExperienciaState.call();
    }
  }

  _isValid() {
    const snackBar = SnackBar(
      content: TextComponent(
        text: 'Formulário com campos inválidos',
        type: TextTypeComponent.statusText,
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
