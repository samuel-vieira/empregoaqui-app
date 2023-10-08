import 'package:emprego_aqui_app/domain/curriculo/entities/competencia_entity.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/curriculo_atom.dart';
import 'package:emprego_aqui_app/feature/curriculo/widgets/competencias_list.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:flutter/material.dart';

class CompetenciasPage extends StatefulWidget {
  const CompetenciasPage({super.key});

  @override
  State<CompetenciasPage> createState() => _CompetenciasPageState();
}

class _CompetenciasPageState extends State<CompetenciasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Competências',
        actions: [_searchBar()],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: CompetenciasList(
          isEditing: true,
        ),
      ),
    );
  }

  Widget _searchBar() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () => showSearch(
        context: context,
        delegate: MySearchDelegate(),
      ),
    );
  }

  Widget competenciasListWidget(String item) {
    return Row(
      children: [
        Text(item),
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final _kOptions = [
    'Flutter',
    'JavaScript',
    'SQL',
    'Dart',
    'Firebase',
    'Google Cloud',
    'AWS',
    'Postgres DB',
    'Maria DB',
    'Figma',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = _kOptions.where((option) {
      final result = option.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            novaCompetencia.value = Competencia(
              nome: suggestion,
              tempo: '2',
            );

            addCompetenciaState.call();
            close(context, null);
          },
        );
      },
    );
  }
}
