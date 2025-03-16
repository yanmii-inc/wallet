import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_provider.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/loan_payments_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';

class PaymentItemTile extends ConsumerWidget {
  const PaymentItemTile({required this.loanId, super.key});
  final int loanId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payment = ref.watch(loanPaymentsProvider(loanId));
    if (payment == null) return const SizedBox();

    return Dismissible(
      key: Key(payment.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) =>
          ref.read(loanPaymentsNotifier(loanId).notifier).delete(payment),
      confirmDismiss: (direction) async {
        return showAdaptiveDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Payment'),
            content:
                const Text('Are you sure you want to delete this payment?'),
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
        title: Text(
          DateTime.parse(payment.date).toDayDdMmYyyy,
          style: context.textTheme.titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(payment.note ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(payment.amount.toIdr),
            Gap.w8,
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        onTap: () => context.pushNamed(
          Routes.loanPaymentEdit.name,
          pathParameters: {'id': payment.id.toString()},
        ),
      ),
    );
  }
}
