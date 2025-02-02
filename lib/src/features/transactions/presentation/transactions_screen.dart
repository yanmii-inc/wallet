import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
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
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        children: [
          const Row(
            children: [
              Text('Pengeluaran'),
              SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.outbond),
              ),
            ],
          ),
          Row(
            children: [
              Text('Pemasukan'.hardcoded),
              const SizedBox(width: 20),
              const FloatingActionButton.small(
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.receipt),
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
        itemBuilder: (context, index) => _TransactionDaySection(),
      ),
    );
  }
}

class _TransactionDaySection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title: const Text('Judul'),
          subtitle: const Text('Sub judul'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rp. 100.000'),
              Gap.w8,
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          onTap: () => context.pushNamed(Routes.transactionsAdd.name),
        );
      },
    );
  }
}
