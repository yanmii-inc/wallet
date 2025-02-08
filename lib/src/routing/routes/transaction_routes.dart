part of '../routes.dart';

final Provider<GoRoute> _transactionRouteProvider = Provider<GoRoute>(
  (ref) {
    return GoRoute(
      path: MainTabRoute.transactions.path,
      parentNavigatorKey: _mainTabNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage(child: TransactionsScreen()),
      routes: [],
    );
  },
);
