import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/config/config.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/common/services/sync_provider.dart';
import 'package:yanmii_wallet/src/features/main/main_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routers = ref.watch(goRouterProvider);
    ref
      ..watch(syncProvider)
      ..watch(transactionSyncProvider)

      // Listen for auth status changes
      ..listen(
        authStateProvider,
        (previous, next) {
          final authChanged =
              (next.hasValue && next.value != null) && previous?.value == null;
          if (authChanged) {
            log('User authenticated, triggering sync');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(syncProvider.notifier).sync();
            });
          }
        },
      );

    final themeMode = ref.watch(appControllerProvider).currentTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: routers.routeInformationParser,
      routerDelegate: routers.routerDelegate,
      routeInformationProvider: routers.routeInformationProvider,
      localizationsDelegates: context.localizationDelegates,
      title: AppConfig.appName.value,
      theme: AppTheme.defaultTheme,
      builder: (context, child) {
        final isProdVariant = F.flavor == Flavor.prod;
        return _FlavorBanner(
          show: !isProdVariant,
          child: child,
        );
      },
      themeMode: themeMode,
    );
  }
}

class _FlavorBanner extends StatelessWidget {
  const _FlavorBanner({
    required this.show,
    this.child,
  });

  final Widget? child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topEnd,
            message: AppConfig.appBannerName.value,
            color: LightColors.errorColor,
            child: child,
          )
        : Container(child: child);
  }
}
