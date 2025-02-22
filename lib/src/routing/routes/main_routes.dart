part of '../routes.dart';

final Provider<ShellRoute> _mainRouteProvider = Provider<ShellRoute>((ref) {
  final authService = ref.watch(authServiceProvider);
  return ShellRoute(
    navigatorKey: _mainTabNavigatorKey,
    pageBuilder: (context, state, child) {
      return NoTransitionPage(
        child: MainScreen(
          location: state.matchedLocation,
          child: child,
        ),
      );
    },
    routes: [
      ref.watch(_transactionRouteProvider),
      GoRoute(
        path: MainTabRoute.wallets.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage(child: WalletScreen()),
      ),
      GoRoute(
          path: MainTabRoute.report.path,
          parentNavigatorKey: _mainTabNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              const NoTransitionPage(
                child: ReportScreen(),
              ),
          routes: [
            GoRoute(
              path: Routes.detailedReport.subPath,
              name: Routes.detailedReport.name,
              pageBuilder: (context, state) {
                final month = (state.extra ?? DateTime.now()) as DateTime;
                return NoTransitionPage(
                  child: DetailedReportScreen(month),
                );
              },
            ),
          ]),
      GoRoute(
        path: MainTabRoute.loans.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          child: ContentScreen(title: MainTabRoute.loans.label),
        ),
      ),
      GoRoute(
        path: MainTabRoute.settings.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        redirect: (context, state) async {
          // TODO: make redirection popable
          final status = await authService.authStatus;
          return status == AuthStatus.unauthenticated
              ? Routes.login.path
              : null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          child: ContentScreen(
            title: MainTabRoute.settings.label,
            content: const LogoutButton(),
          ),
        ),
      ),
    ],
  );
});
