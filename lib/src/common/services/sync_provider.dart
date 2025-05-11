import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/enums/auth_status.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/common/services/cloud_sync_service.dart';

final syncProvider = StateNotifierProvider<SyncNotifier, bool>((ref) {
  return SyncNotifier(ref);
});

class SyncNotifier extends StateNotifier<bool> {
  SyncNotifier(this.ref) : super(false) {
    log('SyncNotifier initialized');
    ref.read(authServiceProvider).authStatus.then((value) {
      if (value == AuthStatus.authenticated) {
        log('User already authenticated on app start, triggering sync');
        sync();
      }
    });
  }

  final Ref ref;

  Future<void> sync() async {
    if (state) {
      log('Sync already in progress, skipping');
      return;
    }

    log('Starting sync process');
    state = true;
    try {
      await ref.read(cloudSyncServiceProvider).syncTransactions();
      log('Sync completed successfully');
    } catch (e) {
      log('Sync failed', error: e);
    } finally {
      state = false;
    }
  }
}
