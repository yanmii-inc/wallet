import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/themes/foundation/sizes.dart';
import 'package:yanmii_wallet/src/features/splash/splash_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_colors.dart';

/// Screen that contains the bottom navigation bar along with the children tabs
class SplashScreen extends ConsumerWidget {
  /// Create [SplashScreen] object with a key
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenController(context, ref);

    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(),
              Gap.h16,
              Text(
                'Splash Screen',
                style: TextStyle(color: context.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenController(BuildContext context, WidgetRef ref) {
    ref.listen(splashControllerProvider, (previous, next) {
      if (!next.isLoading) {
        context.goNamed(MainTabRoute.transactions.name);
      }
    });
  }
}
