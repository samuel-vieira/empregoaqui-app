import 'package:emprego_aqui_app/domain/curriculo/entities/experiencia_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExperienciaFormPage extends StatefulWidget {
  const ExperienciaFormPage({super.key});

  @override
  State<ExperienciaFormPage> createState() => _ExperienciaFormPageState();
}

class _ExperienciaFormPageState extends State<ExperienciaFormPage> {
  final _meses = [
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ',
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

  String dropMesInicioValue = 'JAN';

  String dropAnoInicioValue = '2000';

  String dropMesFimValue = 'JAN';

  String dropAnoFimValue = '2000';

  final cargoController = TextEditingController();

  final empresaController = TextEditingController();

  final descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarComponent(title: 'Nova Experiencia'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: cargoController,
                  decoration: decoration('Cargo'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: empresaController,
                  decoration: decoration('Empresa'),
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    _addExperiencia();
                    context.pop();
                  },
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
    novaExperienciaAtom.value = Experiencia(
      empresa: empresaController.value.text,
      descricao: descricaoController.value.text,
      cargo: cargoController.value.text,
      dataInicio: '$dropMesInicioValue/$dropAnoInicioValue',
      dataFim: '$dropMesFimValue/$dropAnoFimValue',
    );

    addExperienciasState.call();
  }
}
