import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan_payment.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_payment_entity.dart';

class LoanMapper {
  LoanMapper(this.ref);

  final Ref ref;
  LoanEntity mapLoanToLoanEntity(Loan load) {
    final mapper = ref.read(transactionMapperProvider);
    return LoanEntity(
      id: load.id!,
      name: load.name,
      amount: load.amount,
      date: DateTime.parse(load.date),
      type: load.type == 'debt' ? LoanType.debt : LoanType.receivable,
      description: load.description,
      wallet: load.wallet != null && load.wallet?.id != null
          ? mapper.mapWalletToWalletEntity(load.wallet!)
          : null,
      walletId: load.walletId,
    );
  }

  LoanPaymentEntity mapLoanPaymentToLoanPaymentEntity(LoanPayment load) {
    return LoanPaymentEntity(
      id: load.id,
      amount: load.amount,
      date: load.date,
      walletId: load.walletId,
      loanId: load.loanId,
      note: load.note,
    );
  }
}

final loanMapperProvider = Provider<LoanMapper>(LoanMapper.new);
