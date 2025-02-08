import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPicker extends ConsumerWidget {
  WalletPicker({super.key});

  final wallets = [
    'Wallet 1',
    'Wallet 2',
    'Wallet 3',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: GridView.builder(
          itemCount: wallets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            final wallet = wallets[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pop(wallet);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(wallet),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
