import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

class TransactionMapper {
  TransactionMapper(this.ref);

  final Ref ref;

  TransactionEntity mapTransactionToTransactionEntity(Transaction data) =>
      TransactionEntity(
        id: data.id,
        date: data.date,
        wallet:
            data.wallet == null ? null : mapWalletToWalletEntity(data.wallet!),
        amount: data.amount,
        name: data.title,
        category: data.type != TransactionType.transfer.name
            ? (data.category == null
                ? null
                : mapCategoryToCategoryEntity(data.category))
            : const CategoryEntity(label: 'Transfer'),
        type: TransactionType.values.firstWhere(
          (element) => element.name == data.type,
          orElse: () => TransactionType.expense,
        ),
        description: data.description,
      );

  WalletEntity mapWalletToWalletEntity(Wallet data) => WalletEntity(
        id: data.id,
        name: data.name,
        logo: data.logo,
      );

  CategoryEntity mapCategoryToCategoryEntity(Category? category) =>
      CategoryEntity(
        id: category?.id,
        label: category?.label ?? '',
      );
}

final transactionMapperProvider = Provider(TransactionMapper.new);
