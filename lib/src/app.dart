import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/config/config.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/main/main_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routers = ref.watch(goRouterProvider);
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
