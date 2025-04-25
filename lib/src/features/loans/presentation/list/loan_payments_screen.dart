import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/loan_payments_controller.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/payment_item_tile.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class LoanPaymentsSection extends ConsumerStatefulWidget {
  const LoanPaymentsSection({required this.loanId, super.key});

  final int loanId;

  @override
  ConsumerState<LoanPaymentsSection> createState() => _LoansListSectionState();
}

class _LoansListSectionState extends ConsumerState<LoanPaymentsSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(loanPaymentsNotifier(widget.loanId).notifier)
            .fetchLoanPayments();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(loanPaymentsNotifier(widget.loanId));
    ref.listen(loansServiceProvider, (previous, next) {
      if (next.length != previous?.length) {
        ref
            .read(loanPaymentsNotifier(widget.loanId).notifier)
            .fetchLoanPayments();
        _scrollToBottom();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Payments'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(
                Routes.loanEdit.name,
                pathParameters: {'id': widget.loanId.toString()},
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => _showDeleteConfirmationDialog(context),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushNamed(
          Routes.loanPaymentAdd.name,
          pathParameters: {'loan_id': widget.loanId.toString()},
        ),
      ),
      body: transactions.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('No data'));
          }

          return ListView.builder(
            key: const PageStorageKey('loan_payments_list'),
            controller: _scrollController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final loanId = data[index].id;
              if (loanId == null) return const SizedBox.shrink();

              return PaymentItemTile(loanId: loanId);
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

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) async {
    return showModalBottomSheet<bool>(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Delete this loan?'.hardcoded),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton(
                    onPressed: () => context.pop(false),
                    child: Text('Cancel'.hardcoded),
                  ),
                  CommonButton(
                    'Delete'.hardcoded,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    onPressed: () => context.pop(true),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
