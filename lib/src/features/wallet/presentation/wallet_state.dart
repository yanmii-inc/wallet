import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(AsyncLoading<List<WalletEntity>>())
    AsyncValue<List<WalletEntity>> wallets,
  }) = _WalletState;
}
