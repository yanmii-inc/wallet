part of '../routes.dart';

final Provider<GoRoute> _transactionRouteProvider = Provider<GoRoute>((ref) {
  return GoRoute(
    path: Routes.transactions.path,
    name: Routes.transactions.name,
    parentNavigatorKey: _mainTabNavigatorKey,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage(child: AddTransactionScreen()),
    routes: [
      GoRoute(
        path: 'add',
        name: Routes.transactionsAdd.name,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage(child: AddTransactionScreen()),
      ),
    ],
  );
});
