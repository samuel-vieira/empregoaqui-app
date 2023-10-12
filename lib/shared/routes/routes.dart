import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/feature/base/page/base_page.dart';
import 'package:emprego_aqui_app/feature/curriculo/page/competencias_page.dart';
import 'package:emprego_aqui_app/feature/curriculo/page/curriculo_page.dart';
import 'package:emprego_aqui_app/feature/curriculo/page/dados_pessoais_page.dart';
import 'package:emprego_aqui_app/feature/curriculo/page/experiencia_form_page.dart';
import 'package:emprego_aqui_app/feature/curriculo/page/experiencias_page.dart';
import 'package:emprego_aqui_app/feature/home/page/aplicacoes_page.dart';
import 'package:emprego_aqui_app/feature/login/page/login_page.dart';
import 'package:emprego_aqui_app/feature/vagas/page/vaga_details_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const BasePage(),
      routes: [
        GoRoute(
          path: 'aplicacoes',
          builder: (context, state) => const AplicacoesPage(),
        ),
        GoRoute(
          path: 'vaga',
          builder: (context, state) {
            Map<String, dynamic> encodedExtra =
                state.extra as Map<String, dynamic>;
            Vaga vaga = encodedExtra['vaga'];
            bool isEditing = encodedExtra['isEditing'];
            return VagaDetails(
              vaga: vaga,
              isEditing: isEditing,
            );
          },
        ),
        GoRoute(
          path: 'curriculo',
          builder: (context, state) => const CurriculoPage(),
          routes: [
            GoRoute(
              path: 'dados-pessoais',
              builder: (context, state) => const DadosPessoaisPage(),
            ),
            GoRoute(
              path: 'competencias',
              builder: (context, state) => const CompetenciasPage(),
            ),
            GoRoute(
              path: 'experiencia',
              builder: (context, state) => const ExperienciasPage(),
              routes: [
                GoRoute(
                  path: 'experiencia-form',
                  builder: (context, state) => const ExperienciaFormPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
