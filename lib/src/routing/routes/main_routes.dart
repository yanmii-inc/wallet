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
              if (state.extra == null) {
                return const NoTransitionPage(
                  child: ContentScreen(
                    title: 'No Data',
                    content: const Text('No data'),
                  ),
                );
              }
              final extras = state.extra! as Map<String, dynamic>;
              final startDate = extras['start_date'] as DateTime;
              final endDate = startDate.add(const Duration(days: 30));
              return NoTransitionPage(
                child: DetailedReportScreen(
                  startDate: startDate,
                  endDate: endDate,
                ),
              );
            },
          ),
        ],
      ),
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
