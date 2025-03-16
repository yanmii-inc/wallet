// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanPaymentImpl _$$LoanPaymentImplFromJson(Map<String, dynamic> json) =>
    _$LoanPaymentImpl(
      date: json['date'] as String,
      amount: (json['amount'] as num).toInt(),
      loanId: (json['loan_id'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
      walletId: (json['wallet_id'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$LoanPaymentImplToJson(_$LoanPaymentImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'amount': instance.amount,
      'loan_id': instance.loanId,
      'id': instance.id,
      'wallet_id': instance.walletId,
      'note': instance.note,
    };
