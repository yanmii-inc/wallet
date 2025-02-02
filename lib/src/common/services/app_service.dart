// ignore: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/sources/local/hive_service.dart';

class AppService {
  AppService(this.ref);

  final Ref ref;

  bool get initialized => ref.watch(hiveServiceProvider).initialized;
  bool get onboarded => ref.watch(hiveServiceProvider).onboarded;

  set initialized(bool value) {
    ref.watch(hiveServiceProvider).initialized = value;
  }

  set onboarded(bool value) {
    ref.watch(hiveServiceProvider).onboarded = value;
  }

  ThemeMode toggleThemeMode() {
    final newTheme =
        ref.watch(hiveServiceProvider).currentTheme == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;

    ref.watch(hiveServiceProvider).currentTheme = newTheme;

    return newTheme;
  }

  ThemeMode get themeMode => ref.watch(hiveServiceProvider).currentTheme;
}

final appServiceProvider = Provider(AppService.new);
