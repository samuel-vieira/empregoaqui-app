import 'package:emprego_aqui_app/feature/vagas/widgets/vagas_lista_widget.dart';
import 'package:emprego_aqui_app/feature/vagas/widgets/vagas_search_bar_widget.dart';
import 'package:flutter/material.dart';

class VagasPage extends StatelessWidget {
  const VagasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const Column(
          children: [
            VagasSearchBarWidget(),
            SizedBox(
              height: 20,
            ),
            VagasListaWidget(),
          ],
        );
      },
    );
  }
}
