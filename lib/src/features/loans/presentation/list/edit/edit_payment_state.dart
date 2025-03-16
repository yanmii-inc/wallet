import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_payment_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'edit_payment_state.freezed.dart';

@freezed
class EditPaymentState with _$EditPaymentState {
  const factory EditPaymentState({
    @Default(AsyncLoading<LoanPaymentEntity>())
    AsyncValue<LoanPaymentEntity> payment,
    @Default(null) DateTime? date,
    @Default(AsyncLoading<List<WalletEntity>>())
    AsyncValue<List<WalletEntity>> walletOptions,
    @Default(null) WalletEntity? wallet,
    @Default(0) int amount,
    @Default('') String note,
    @Default(false) bool isFormValid,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus? submissionStatus,
  }) = _EditPaymentState;
}
