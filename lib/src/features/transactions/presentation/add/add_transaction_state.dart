import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'add_transaction_state.freezed.dart';

@freezed
class AddTransactionState with _$AddTransactionState {
  const factory AddTransactionState({
    @Default(null) DateTime? date,
    @Default(AsyncLoading<List<WalletEntity>>())
    AsyncValue<List<WalletEntity>> walletOptions,
    @Default(null) WalletEntity? wallet,
    @Default('') String name,
    @Default(0) int amount,
    @Default(AsyncLoading<List<CategoryEntity>>())
    AsyncValue<List<CategoryEntity>> categoryOptions,
    @Default(null) CategoryEntity? category,
    @Default('') String description,
    @Default(TransactionType.expense) TransactionType type,
    @Default(false) bool isFormValid,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus? submissionStatus,
  }) = _AddTransactionState;
}
