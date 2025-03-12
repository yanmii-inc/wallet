import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/loan_item_tile.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/loans_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class LoansScreen extends ConsumerStatefulWidget {
  const LoansScreen({super.key});

  @override
  ConsumerState<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends ConsumerState<LoansScreen> {
  final ScrollController _scrollController = ScrollController();
  final _fabKey = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(loansControllerProvider).transactions;
    ref.listen(loansServiceProvider, (previous, next) {
      if (next.length != previous?.length) {
        ref.read(loansControllerProvider.notifier).getLoans();
        _scrollToBottom();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Loans'.hardcoded)),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _fabKey,
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 70,
        openButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (context, onPressed, isOpen) => FloatingActionButton(
            onPressed: onPressed,
            child: const Icon(Icons.add_card),
          ),
        ),
        children: [
          Row(
            children: [
              Text('Debt'.hardcoded),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () {
                  _fabKey.currentState?.toggle();
                  context.pushNamed(
                    Routes.loanAdd.name,
                    pathParameters: {'type': LoanType.debt.name},
                  );
                },
                child: const Icon(Icons.shopping_bag),
              ),
            ],
          ),
          Row(
            children: [
              Text('Receiveable'.hardcoded),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () {
                  _fabKey.currentState?.toggle();
                  context.pushNamed(
                    Routes.loanAdd.name,
                    pathParameters: {'type': LoanType.receivable.name},
                  );
                },
                child: const Icon(Icons.receipt),
              ),
            ],
          ),
        ],
      ),
      body: transactions.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('No data'));
          }

          return ListView.builder(
            key: const PageStorageKey('loans_list'),
            controller: _scrollController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final transactionId = data[index].id;
              return LoanItemTile(transactionId: transactionId);
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients && _scrollController.position.pixels > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }
}
