part of '../routes.dart';

final Provider<GoRoute> _transactionRouteProvider = Provider<GoRoute>(
  (ref) {
    return GoRoute(
      path: MainTabRoute.transactions.path,
      name: MainTabRoute.transactions.name,
      parentNavigatorKey: _mainTabNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const NoTransitionPage(child: TransactionsScreen()),
      routes: [
        GoRoute(
          path: '${Routes.transactionHistory.subPath}/by-title/:title/:date',
          name: '${Routes.transactionHistory.name}byTitle',
          pageBuilder: (context, state) => NoTransitionPage(
            child: TransactionHistoryScreen(
              title: state.pathParameters['title'] ?? '',
              type: TransactionHistoryType.title,
              startDate: DateTime.parse(state.pathParameters['date'] ?? ''),
            ),
          ),
        ),
        GoRoute(
          path:
              '${Routes.transactionHistory.subPath}/by-category/:category_id/:date',
          name: '${Routes.transactionHistory.name}byCategory',
          pageBuilder: (context, state) => NoTransitionPage(
            child: TransactionHistoryScreen(
              categoryId: int.parse(state.pathParameters['category_id']!),
              type: TransactionHistoryType.category,
              startDate: DateTime.parse(state.pathParameters['date'] ?? ''),
            ),
          ),
        ),
      ],
    );
  },
);
