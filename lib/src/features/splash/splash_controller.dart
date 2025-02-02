import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/services/app_service.dart';
import 'package:yanmii_wallet/src/features/splash/splash_state.dart';

class SplashController extends StateNotifier<SplashState> {
  SplashController(this.ref) : super(const SplashState());
  final Ref ref;

  Future<void> loading() async {
    state = state.copyWith(isLoading: true);
    final appService = ref.watch(appServiceProvider);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        state = state.copyWith(isLoading: false);
        appService.initialized = true;
      },
    );
  }
}

final splashControllerProvider =
    StateNotifierProvider<SplashController, SplashState>((ref) {
  final homeController = SplashController(ref)..loading();
  return homeController;
});
