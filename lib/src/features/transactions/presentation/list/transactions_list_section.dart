import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/avatar.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';

class TransactionsListSection extends ConsumerStatefulWidget {
  const TransactionsListSection({super.key});

  @override
  ConsumerState<TransactionsListSection> createState() =>
      _TransactionDaySectionState();
}

class _TransactionDaySectionState
    extends ConsumerState<TransactionsListSection> {
  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionsControllerProvider).transactions;
    return transactions.when(
      data: (data) {
        if (data.isEmpty) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: const Center(child: Text('No data')),
          );
        }

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return _TransactionItemTile(ref: ref, item: item);
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

class _TransactionItemTile extends StatefulWidget {
  const _TransactionItemTile({
    required this.ref,
    required this.item,
  });

  final WidgetRef ref;
  final TransactionEntity item;

  @override
  State<_TransactionItemTile> createState() => _TransactionItemTileState();
}

class _TransactionItemTileState extends State<_TransactionItemTile>
    with TickerProviderStateMixin {
  late SlidableController _controller;

  @override
  void initState() {
    _controller = SlidableController(this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _controller.openStartActionPane,
      child: Slidable(
        controller: _controller,
        key: const ValueKey(0),
        enabled: false,
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.ref
                    .read(transactionsControllerProvider.notifier)
                    .delete(widget.item);
              },
              backgroundColor: context.theme.colorScheme.error,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
              label: 'Delete',
            ),
          ],
        ),
        child: TransactionItemTile(item: widget.item),
      ),
    );
  }
}

class TransactionItemTile extends StatelessWidget {
  const TransactionItemTile({required this.item, super.key});
  final TransactionEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      dense: true,
      leading: NameAvatar(name: item.wallet?.name ?? '?'),
      title: Text(
        item.category != null ? item.category!.label : item.name,
        style:
            context.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
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
      onTap: () => context.pushNamed(
        Routes.transactionsEdit.name,
        pathParameters: {'id': item.id!.toString()},
      ),
    );
  }
}
