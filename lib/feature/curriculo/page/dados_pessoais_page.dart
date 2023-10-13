import 'package:asp/asp.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';
import 'package:emprego_aqui_app/shared/app_bar_component/app_bar_component.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({super.key});

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.select(() => userInfoAtom.value);
    final GlobalKey<FormState> key = GlobalKey();

    nomeController.text = user.username;
    emailController.text = user.email;
    telefoneController.text = user.telefone;

    return Scaffold(
      appBar: const AppBarComponent(title: 'Dados Pessoais'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  nomeInput(),
                  const SizedBox(
                    height: 20,
                  ),
                  emailInput(),
                  const SizedBox(
                    height: 20,
                  ),
                  telefoneInput(),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!key.currentState!.validate()) {
                    return;
                  }

                  Map<String, dynamic> map = {};

                  if (nomeController.value.text.isNotEmpty &&
                      nomeController.value.text != user.username) {
                    map.addAll({'nome': nomeController.value.text});
                  }

                  if (emailController.value.text.isNotEmpty &&
                      emailController.value.text != user.email) {
                    map.addAll({'email': emailController.value.text});
                  }

                  if (telefoneController.value.text.isNotEmpty &&
                      telefoneController.value.text != user.telefone) {
                    map.addAll({'telefone': telefoneController.value.text});
                  }

                  if (map.isNotEmpty) {
                    userDataToUpdate.value = map;
                    _updateUser().then((value) {
                      const snackBar = SnackBar(
                        content: Text(
                          "Dado alterado com sucesso!",
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }).catchError((error) {
                      const snackBar = SnackBar(
                        content: Text(
                          "Erro ao alterar dado",
                        ),
                        backgroundColor: Colors.red,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  } else {
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
                  }
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nomeInput() {
    return TextFormField(
      controller: nomeController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        hintText: 'Nome',
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo não pode estar vazio';
        }

        return null;
      },
    );
  }

  Widget emailInput() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        hintText: 'exemplo@email.com',
      ),
      maxLength: 40,
      validator: (value) {
        const pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        final RegExp regExp = RegExp(pattern);

        if (value == null || value.isEmpty) {
          return 'Campo não pode estar vazio';
        }

        if (!regExp.hasMatch(value)) {
          return 'Valor inválido';
        }

        return null;
      },
    );
  }

  Widget telefoneInput() {
    var mask = MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return TextFormField(
      inputFormatters: [mask],
      controller: telefoneController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        hintText: '(00) 0 0000-0000',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo não pode estar vazio';
        }

        if (value.length != 16) {
          return 'Formato inválido';
        }

        return null;
      },
    );
  }

  Future _updateUser() async {
    updateUserInfoState.call();
  }
}
