part of '../routes.dart';

final _authRoutesProvider = Provider(
  (ref) => ShellRoute(
    navigatorKey: _authNavigatorKey,
    builder: (context, state, child) => child,
    routes: [
      GoRoute(
        path: Routes.signIn.path,
        name: Routes.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: Routes.signUp.path,
        name: Routes.signUp.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpScreen(),
      ),
    ],
  ),
);
