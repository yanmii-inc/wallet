import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/avatar.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';

class WalletPicker extends ConsumerWidget {
  const WalletPicker({
    required this.options,
    required this.onSelected,
    this.selectedWallets,
    super.key,
  });

  final List<WalletEntity> options;
  final List<WalletEntity>? selectedWallets;
  final void Function(WalletEntity wallet) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: GridView.builder(
          itemCount: options.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = options[index];
            final alreadySelected = selectedWallets?.any(
                  (element) => element.id == item.id,
                ) ??
                false;
            return InkWell(
              onTap: () {
                context.pop(item);
                onSelected(item);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap.h12,
                            NameAvatar(name: item.name),
                            Gap.h12,
                            Text(item.name),
                          ],
                        ),
                      ),
                      if (alreadySelected)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
