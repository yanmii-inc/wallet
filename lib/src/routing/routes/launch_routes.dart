part of '../routes.dart';

final _launchRoutesProvider = Provider(
  (ref) => ShellRoute(
    navigatorKey: _initNavigatorKey,
    builder: (context, state, child) => child,
    routes: [
      GoRoute(
        path: Routes.onboarding.path,
        name: Routes.onboarding.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: OnboardingScreen()),
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
    ],
  ),
);
