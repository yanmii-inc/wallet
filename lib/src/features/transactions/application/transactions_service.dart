import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';

class TransactionsService {
  TransactionsService(this.ref);

  Ref ref;

  TransactionRepository get _transactionRepository =>
      ref.watch(transactionRepositoryProvider);

  Future<int> saveTransaction({
    required String amount,
    required DateTime date,
    required String description,
    required String walletId,
    required String categoryId,
    required TransactionType type,
  }) async {
    final transaction = Transaction(
      amount: double.parse(amount),
      date: date.toIso8601String(),
      description: description,
      wallet: walletId,
      category: categoryId,
      type: type,
    );
    final id = await _transactionRepository.createTransaction(transaction);
    return id;
  }
}

final transactionsServiceProvider =
    Provider<TransactionsService>(TransactionsService.new);
