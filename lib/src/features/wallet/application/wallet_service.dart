import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/repositories/wallet_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

class WalletService extends StateNotifier<AsyncValue<List<WalletEntity>>> {
  WalletService(this.ref) : super(const AsyncLoading());
  Ref ref;
  WalletRepository get _walletRepository => ref.read(walletRepositoryProvider);

  Future<void> getWallets() async {
    final result = await _walletRepository.getWallets();

    result.when(
      success: (data) {
        final mapper = ref.read(transactionMapperProvider);
        final walletEntities =
            data.map(mapper.mapWalletToWalletEntity).toList();
        state = AsyncValue.data(walletEntities);
      },
      failure: (error, stackTrace) => state = AsyncError(error, stackTrace),
    );
  }
}

final walletServiceProvider =
    StateNotifierProvider<WalletService, AsyncValue<List<WalletEntity>>>(
  WalletService.new,
);
