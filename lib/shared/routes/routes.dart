import 'package:emprego_aqui_app/feature/base/base_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BasePage(),
    ),
  ],
);
