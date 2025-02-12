part of '../routes.dart';

final _authRoutesProvider = Provider(
  (ref) => ShellRoute(
    navigatorKey: _authNavigatorKey,
    builder: (context, state, child) => child,
    routes: [
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterScreen(),
      ),
    ],
  ),
);
