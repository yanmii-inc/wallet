part of '../routes.dart';

final Provider<GoRoute> _transactionRouteProvider = Provider<GoRoute>(
  (ref) {
    return GoRoute(
      path: MainTabRoute.transactions.path,
      name: MainTabRoute.transactions.name,
      parentNavigatorKey: _mainTabNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const NoTransitionPage(child: TransactionsScreen()),
    );
  },
);
