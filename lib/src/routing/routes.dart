import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/common/services/app_service.dart';
import 'package:yanmii_wallet/src/features/auth/presentation/auth_screen.dart';
import 'package:yanmii_wallet/src/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:yanmii_wallet/src/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/add/add_loan_screen.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/edit/edit_loan_screen.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/add/add_payment_screen.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/edit/edit_payment_screen.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/loan_payments_screen.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/loans_screen.dart';
import 'package:yanmii_wallet/src/features/main/main_screen.dart';
import 'package:yanmii_wallet/src/features/onboarding/onboarding_screen.dart';
import 'package:yanmii_wallet/src/features/report/presentation/detailed_report_screen.dart';
import 'package:yanmii_wallet/src/features/report/presentation/report_screen.dart';
import 'package:yanmii_wallet/src/features/report/presentation/transaction_history_screen.dart';
import 'package:yanmii_wallet/src/features/splash/splash_screen.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_screen.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/edit/edit_transaction_screen.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_screen.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_screen.dart';
import 'package:yanmii_wallet/src/logging/analytics.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

export 'package:go_router/go_router.dart';

part 'route_enums.dart';
// It is better to split the route into smal chunks based on their focused area
// or based on feature modules

part 'routes/launch_routes.dart';
part 'routes/auth_routes.dart';
part 'routes/main_routes.dart';
part 'routes/transaction_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _authNavigatorKey = GlobalKey<NavigatorState>();
final _initNavigatorKey = GlobalKey<NavigatorState>();
final _mainTabNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final appService = ref.watch(appServiceProvider);

  return GoRouter(
    initialLocation: MainTabRoute.transactions.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) async {
      final initialized = appService.initialized;
      final onboarded = appService.onboarded;

      final goingToInit = state.matchedLocation == Routes.splash.path;
      final goingToOnboard = state.matchedLocation == Routes.onboarding.path;

      if (!initialized && !goingToInit) {
        return Routes.splash.path;
      }

      if (initialized && !onboarded && !goingToOnboard) {
        return Routes.onboarding.path;
      }

      return null;
    },
    observers: [AnalyticsService.instance],
    routes: [
      ref.watch(_launchRoutesProvider),
      GoRoute(
        path: '${MainTabRoute.transactions.path}/add/:type/:date',
        name: Routes.transactionsAdd.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final typeArg = state.pathParameters['type']!;
          final dateArg = state.pathParameters['date']!;
          final type = TransactionType.values.firstWhere(
            (element) => element.name == typeArg,
            orElse: () => TransactionType.expense,
          );
          final dateTime = DateTime.parse(dateArg);
          return MaterialPage(
            child: AddTransactionScreen(
              type: type,
              date: dateTime,
            ),
          );
        },
      ),
      GoRoute(
        path: '${MainTabRoute.loans.path}/add/:type',
        name: Routes.loanAdd.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final typeArg = state.pathParameters['type']!;
          final type = LoanType.values.firstWhere(
            (element) => element.name == typeArg,
            orElse: () => LoanType.debt,
          );
          return MaterialPage(
            child: AddLoanScreen(type: type),
          );
        },
      ),
      GoRoute(
        path: '${MainTabRoute.transactions.path}/edit/:id',
        name: Routes.transactionsEdit.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(child: EditTransactionScreen(id: int.parse(id)));
        },
      ),
      GoRoute(
        path: '${MainTabRoute.loans.path}/edit/:id',
        name: Routes.loanEdit.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(child: EditLoanScreen(id: int.parse(id)));
        },
      ),
      GoRoute(
        path: '${Routes.loanPayments.path}/:loan_id',
        name: Routes.loanPayments.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['loan_id']!;
          return MaterialPage(
            child: LoanPaymentsSection(loanId: int.parse(id)),
          );
        },
        routes: [
          GoRoute(
            path: 'add',
            name: Routes.loanPaymentAdd.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final id = state.pathParameters['loan_id']!;
              return MaterialPage(
                child: AddPaymebtScreen(loanId: int.parse(id)),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '${Routes.loanPayments.path}/:id/edit',
        name: Routes.loanPaymentEdit.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(child: EditPaymentScreen(id: int.parse(id)));
        },
      ),
      ref.watch(_mainRouteProvider),
      ref.watch(_authRoutesProvider),
    ],
  );
});
