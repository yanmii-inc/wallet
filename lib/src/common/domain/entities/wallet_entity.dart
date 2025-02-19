import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_entity.freezed.dart';

@freezed
class WalletEntity with _$WalletEntity {
  const factory WalletEntity({
    required int id,
    required String name,
    @Default(null) String? logo,
    @Default(0) int balance,
  }) = _WalletEntity;
}
