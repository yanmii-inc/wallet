import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/themes/themes.dart';
import 'package:yanmii_wallet/src/common/components/avatar.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/add/add_wallet_dialog.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/add/edit_wallet_screen.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_controller.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';

/// [WalletScreen] is a screen for Wallet
class WalletScreen extends ConsumerWidget {
  /// Create [WalletScreen] object with a key
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletControllerProvider).wallets;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          useSafeArea: true,
          builder: (context) => AddWalletDialog(
            onSaved: (logo, name, balance) {
              log('logo $logo');
              ref
                  .read(walletControllerProvider.notifier)
                  .addWallet(logo, name, balance);
            },
          ),
        ),
      ),
      body: wallets.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: data[index].logo != null
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: FileImage(File(data[index].logo!)),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 48,
                      width: 48,
                    )
                  : NameAvatar(
                      name: data[index].name,
                      size: 48,
                    ),
              title: Text(
                data[index].name,
                style: context.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5,
                  color: LightColors.neutralColor,
                ),
              ),
              trailing: Text(
                data[index].balance.toIdr,
                style: context.textTheme.bodyMedium,
              ),
              onTap: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                showDragHandle: true,
                useSafeArea: true,
                builder: (context) => EditWalletDialog(
                  wallet: data[index],
                  onSaved: (logo, name) {
                    ref
                        .read(walletControllerProvider.notifier)
                        .editWallet(data[index].id, logo, name);
                  },
                ),
              ),
            );
          },
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
