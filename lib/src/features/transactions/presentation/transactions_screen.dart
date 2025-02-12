import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

/// [TransactionsScreen] is a screen for Transactions
class TransactionsScreen extends ConsumerWidget {
  /// Create [TransactionsScreen] object with a key
  TransactionsScreen({super.key});

  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text('Mon, 3 Feb 2025'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.history)),
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 70,
        overlayStyle:
            ExpandableFabOverlayStyle(color: Colors.white.withOpacity(0.9)),
        children: [
          Row(
            children: [
              const Text('Pengeluaran'),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () => context.pushNamed(
                  Routes.transactionsAdd.name,
                  pathParameters: {'type': TransactionType.expense.name},
                ),
                child: const Icon(Icons.shopping_bag),
              ),
            ],
          ),
          Row(
            children: [
              Text('Pemasukan'.hardcoded),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () => context.pushNamed(
                  Routes.transactionsAdd.name,
                  pathParameters: {'type': TransactionType.income.name},
                ),
                child: const Icon(Icons.receipt),
              ),
            ],
          ),
          const Row(
            children: [
              Text('Pindah Dana'),
              SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.payment),
              ),
            ],
          ),
          const FloatingActionButton.small(
            heroTag: null,
            onPressed: null,
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: 3,
        onPageChanged: (value) =>
            ref.read(transactionsControllerProvider.notifier).getTransactions(),
        itemBuilder: (context, index) => _TransactionDaySection(),
      ),
    );
  }
}

class _TransactionDaySection extends ConsumerStatefulWidget {
  @override
  _TransactionDaySectionState createState() => _TransactionDaySectionState();
}

class _TransactionDaySectionState
    extends ConsumerState<_TransactionDaySection> {
  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionsControllerProvider).transactions;

    return transactions.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No data'));
        }

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              dense: true,
              title: Text(
                item.category != null ? item.category!.label : item.name,
                style: context.textTheme.titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.amount.toIdr),
                  Gap.w8,
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
              onTap: () => context.pushNamed(Routes.transactionsAdd.name),
            );
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
