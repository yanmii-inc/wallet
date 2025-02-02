import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/item.dart';
import 'package:yanmii_wallet/src/features/main/home/home_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/text_styles.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

// Any widget or screen having more than 200 lines of code is to be splitted
// into multiple parts
// Private widgets go here
part 'widgets/content_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(homeControllerProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: Text(MainTabRoute.tab1.label),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(homeControllerProvider.notifier).fetchItems(),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: items.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : _ContentWidget(),
    );
  }
}
