import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_state.dart';

class AddTransactionController extends StateNotifier<AddTransactionState> {
  AddTransactionController(this.ref) : super(const AddTransactionState());

  final Ref ref;

  void _validate() {
    final isValid = state.date != null &&
        state.wallet.isNotEmpty &&
        state.name.isNotEmpty &&
        state.amount > 0 &&
        state.category.isNotEmpty;
    state = state.copyWith(isFormValid: isValid);
  }

  void updateDate(DateTime value) {
    state = state.copyWith(date: value);
    _validate();
  }

  void updateWallet(String value) {
    state = state.copyWith(wallet: value);
    _validate();
  }

  void updateName(String value) {
    state = state.copyWith(name: value);
    _validate();
  }

  void updateAmount(int value) {
    state = state.copyWith(amount: value);
    _validate();
  }

  void updateCategory(String value) {
    state = state.copyWith(category: value);
    _validate();
  }

  void updateDescription(String value) {
    state = state.copyWith(description: value);
    _validate();
  }
}

final addTransactionControllerProvider =
    StateNotifierProvider<AddTransactionController, AddTransactionState>(
  AddTransactionController.new,
);
