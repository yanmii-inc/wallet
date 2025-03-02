import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/list/transactions_list_section.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

/// [TransactionsScreen] is a screen for Transactions
class TransactionsScreen extends ConsumerStatefulWidget {
  /// Create [TransactionsScreen] object with a key
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen>
    with TickerProviderStateMixin {
  final _fabKey = GlobalKey<ExpandableFabState>();
  TransactionsController get _controller =>
      ref.read(transactionsControllerProvider.notifier);
  bool _isForward = false;
  late AnimationController _animationController;
  late Animation<Offset> _animationForward;
  late Animation<Offset> _animationBackward;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animationForward = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(_animationController);
    _animationBackward = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(_animationController);

    Future.delayed(Duration.zero, () {
      _animationController
        ..reset()
        ..forward();
      _controller.getTransactions(DateTime.now());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(transactionsControllerProvider).selectedDate;

    ref.listen(
      transactionsControllerProvider,
      (previous, next) {
        if (previous == null) return;
        if (previous.selectedDate != next.selectedDate) {
          log('selectedDate: ${next.selectedDate}');
          _isForward = next.selectedDate.isAfter(previous.selectedDate);
          _animationController
            ..reset()
            ..forward();
          _controller.getTransactions(next.selectedDate);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                _controller.backward(selectedDate);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Text(
                DateFormat('EEEE, MMM d, y', 'id_ID').format(selectedDate),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {
                _controller.forward(selectedDate);
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
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
              const Text('Pengeluaran'),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () {
                  _fabKey.currentState?.toggle();
                  context.pushNamed(
                    Routes.transactionsAdd.name,
                    pathParameters: {
                      'type': TransactionType.expense.name,
                      'date': selectedDate.toIso8601String(),
                    },
                  );
                },
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
                onPressed: () {
                  _fabKey.currentState?.toggle();
                  context.pushNamed(
                    Routes.transactionsAdd.name,
                    pathParameters: {
                      'type': TransactionType.income.name,
                      'date': selectedDate.toIso8601String(),
                    },
                  );
                },
                child: const Icon(Icons.receipt),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Pindah Dana'),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () {
                  _fabKey.currentState?.toggle();
                  context.pushNamed(
                    Routes.transactionsAdd.name,
                    pathParameters: {
                      'type': TransactionType.transfer.name,
                      'date': selectedDate.toIso8601String(),
                    },
                  );
                },
                child: const Icon(Icons.payment),
              ),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            _isForward = false;
          } else if (details.delta.dx < 0) {
            _isForward = true;
          }
        },
        onTap: () {
          if (_fabKey.currentState?.isOpen ?? false) {
            _fabKey.currentState?.toggle();
          }
        },
        onPanEnd: (details) {
          if (_isForward) {
            _controller.forward(selectedDate);
          } else {
            _controller.backward(selectedDate);
          }
        },
        child: SlideTransition(
          position: _isForward ? _animationForward : _animationBackward,
          child: const TransactionsListSection(),
        ),
      ),
    );
  }
}
