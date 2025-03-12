import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'add_loan_state.freezed.dart';

@freezed
class AddLoanState with _$AddLoanState {
  const factory AddLoanState({
    @Default(null) DateTime? date,
    @Default(AsyncLoading<List<WalletEntity>>())
    AsyncValue<List<WalletEntity>> walletOptions,
    @Default(null) LoanType? type,
    @Default(null) WalletEntity? wallet,
    @Default('') String name,
    @Default(0) int amount,
    @Default('') String description,
    @Default(false) bool isFormValid,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus? submissionStatus,
  }) = _AddLoanState;
}
