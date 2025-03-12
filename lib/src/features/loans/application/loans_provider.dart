import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';

final loansProvider = Provider.family<LoanEntity?, int>((ref, id) {
  final loans = ref.watch(loansServiceProvider);
  return loans.firstWhereOrNull((t) => t.id == id);
});
