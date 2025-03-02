import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';

final transactionProvider = Provider.family<TransactionEntity?, int>((ref, id) {
  final transactions = ref.watch(transactionsServiceProvider);
  return transactions.firstWhereOrNull((t) => t.id == id);
});
