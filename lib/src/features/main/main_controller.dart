import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/services/app_service.dart';
import 'package:yanmii_wallet/src/features/main/main_state.dart';

class AppController extends StateNotifier<AppState> {
  AppController(this.ref) : super(const AppState());

  final Ref ref;

  void toggleThemeMode() {
    final newTheme = ref.watch(appServiceProvider).toggleThemeMode();
    state = state.copyWith(currentTheme: newTheme);
  }

  void currentTheme() {
    final currentTheme = ref.watch(appServiceProvider).themeMode;
    state = state.copyWith(currentTheme: currentTheme);
  }
}

final appControllerProvider = StateNotifierProvider<AppController, AppState>(
  (ref) => AppController(ref)..currentTheme(),
);
