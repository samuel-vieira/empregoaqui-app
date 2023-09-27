import 'package:emprego_aqui_app/domain/vagas/entities/vaga_entity.dart';
import 'package:emprego_aqui_app/feature/base/page/base_page.dart';
import 'package:emprego_aqui_app/feature/login/page/login_page.dart';
import 'package:emprego_aqui_app/feature/vagas/page/vaga_datails_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const BasePage(),
      routes: [
        GoRoute(
          path: 'vaga',
          builder: (context, state) {
            Vaga vaga = state.extra as Vaga;
            return VagaDetails(
              vaga: vaga,
            );
          },
        ),
      ],
    ),
  ],
);
