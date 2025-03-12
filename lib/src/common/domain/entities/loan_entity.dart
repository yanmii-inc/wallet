import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'loan_entity.freezed.dart';

@freezed
class LoanEntity with _$LoanEntity {
  const factory LoanEntity({
    required int id,
    required String name,
    required int amount,
    required LoanType type,
    required DateTime date,
    @Default(null) WalletEntity? wallet,
    @Default(null) int? walletId,
    @Default(null) String? description,
  }) = _LoanEntity;
}

enum LoanType { debt, receivable }
