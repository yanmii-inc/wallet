
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/config/result.dart';
import 'package:yanmii_wallet/src/features/transactions/domain/entities/transaction_item_entity.dart';

class TransactionsService {
  const TransactionsService();
  // final TransactionsRepository transactionsRepository;


  Future<Result<TransactionItemEntity>> get transactionItemEntity async {
    // TODO: connect to repositories or do something else
    return const Result.success(TransactionItemEntity());
  }
}


final transactionsServiceProvider = Provider<TransactionsService>(
  (ref) => const TransactionsService(),);
