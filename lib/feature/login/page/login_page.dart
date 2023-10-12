import 'package:emprego_aqui_app/feature/home/controllers/atoms/home_atom.dart';
import 'package:emprego_aqui_app/feature/login/controllers/atoms/user_atom.dart';
import 'package:emprego_aqui_app/feature/login/widgets/nome_widget.dart';
import 'package:emprego_aqui_app/main.dart';
import 'package:emprego_aqui_app/services/db/firebase_service.dart';
import 'package:emprego_aqui_app/shared/text/text_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController(text: 'empregoaqui@admin.com');

  final TextEditingController passwordController =
      TextEditingController(text: 'eaadmin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NomeWidget(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Usuário',
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onChanged: (_) =>
                              email.value = emailController.value.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Senha',
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onChanged: (_) =>
                              password.value = passwordController.value.text,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              _login(context).then((_) {
                                fetchSetupDataState.call();
                                context.go('/');
                              });
                            },
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const TextComponent(
                          text: 'Version 1.0.0',
                          type: TextTypeComponent.paragrafo1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _login(BuildContext context) async {
    try {
      await getIt<FirebaseService>().auth.signInWithEmailAndPassword(
            email: emailController.value.text,
            password: passwordController.value.text,
          );
    } on FirebaseAuthException catch (e) {
      final message = e.code == 'INVALID_LOGIN_CREDENTIALS'
          ? "Login ou senha incorretos"
          : "Erro ao logar. Tente novamente mais tarde";

      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      );

      debugPrint("code: ${e.code}");
      debugPrint("message: ${e.message}");

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      throw Exception(e.code);
    }
  }
}
