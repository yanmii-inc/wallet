import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'add_payment_state.freezed.dart';

@freezed
class AddPaymentState with _$AddPaymentState {
  const factory AddPaymentState({
    @Default(null) DateTime? date,
    @Default(AsyncLoading<List<WalletEntity>>())
    AsyncValue<List<WalletEntity>> walletOptions,
    @Default(null) WalletEntity? wallet,
    @Default(0) int amount,
    @Default('') String note,
    @Default(false) bool isFormValid,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus? submissionStatus,
  }) = _AddPaymentState;
}
