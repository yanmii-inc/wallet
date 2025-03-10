import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/enums/auth_status.dart';
import 'package:yanmii_wallet/src/common/services/app_service.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/features/auth/login/login_screen.dart';
import 'package:yanmii_wallet/src/features/auth/logout/logout_button.dart';
import 'package:yanmii_wallet/src/features/auth/register/register_screen.dart';
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
part 'routes/auth_routes.dart';
part 'routes/launch_routes.dart';
part 'routes/main_routes.dart';
part 'routes/transaction_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _initNavigatorKey = GlobalKey<NavigatorState>();
final _mainTabNavigatorKey = GlobalKey<NavigatorState>();
final _authNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final appService = ref.watch(appServiceProvider);
  final authService = ref.watch(authServiceProvider);

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
    refreshListenable: authService,
    observers: [AnalyticsService.instance],
    routes: [
      ref.watch(_launchRoutesProvider),
      ref.watch(_authRoutesProvider),
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
        path: '${MainTabRoute.transactions.path}/edit/:id',
        name: Routes.transactionsEdit.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(child: EditTransactionScreen(id: int.parse(id)));
        },
      ),
      ref.watch(_mainRouteProvider),
    ],
  );
});
