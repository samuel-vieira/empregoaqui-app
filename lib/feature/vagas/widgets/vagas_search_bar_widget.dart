import 'package:emprego_aqui_app/feature/vagas/controllers/atoms/vaga_atom.dart';
import 'package:flutter/material.dart';

class VagasSearchBarWidget extends StatelessWidget {
  const VagasSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => vagaFieldTextState.value = value,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        suffixIcon: Icon(Icons.search),
      ),
      onTapOutside: (_) {
        FocusScopeNode focusScope = FocusScope.of(context);

        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
    );
  }
}
