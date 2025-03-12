import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/avatar.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_provider.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/loans_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';

class LoanItemTile extends ConsumerWidget {
  const LoanItemTile({required this.transactionId, super.key});
  final int transactionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loan = ref.watch(loansProvider(transactionId));
    if (loan == null) return const SizedBox();

    return Dismissible(
      key: Key(loan.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) =>
          ref.read(loansControllerProvider.notifier).delete(loan),
      confirmDismiss: (direction) async {
        return showAdaptiveDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Transaction'),
            content:
                const Text('Are you sure you want to delete this transaction?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  context.pop(true);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        dense: true,
        leading: CircleAvatar(
          child: Icon(
            loan.type == LoanType.debt
                ? Icons.arrow_downward
                : Icons.arrow_upward,
          ),
        ),
        title: Text(
          loan.name,
          style: context.textTheme.titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(loan.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(loan.amount.toIdr),
            Gap.w8,
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        onTap: () => context.pushNamed(
          Routes.loanEdit.name,
          pathParameters: {'id': loan.id.toString()},
        ),
      ),
    );
  }
}
