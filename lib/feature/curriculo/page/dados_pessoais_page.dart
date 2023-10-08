import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/curriculo/controllers/atom/user_atom.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:flutter/material.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({super.key});

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  final TextEditingController nomeController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.select(() => userAtom.value);

    nomeController.text = user.nome ?? '';
    emailController.text = user.email ?? '';

    return Scaffold(
      appBar: const AppBarComponent(title: 'Dados Pessoais'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      hintText: 'Nome',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  nomeTextFieldAtom.value = nomeController.value.text;
                  emailTextFieldAtom.value = emailController.value.text;

                  updateUserState.call();
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
