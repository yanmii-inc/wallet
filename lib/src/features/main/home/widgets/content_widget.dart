part of '../home_screen.dart';

class _ContentWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(homeControllerProvider).value;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = items.value?[index];
        return _ItemCard(item: item);
      },
      itemCount: items.value?.length,
    ).withDefaultPadding;
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.item});

  final Item? item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item?.title ?? '',
                              style: context.titleSmall,
                            ),
                            Text(
                              item?.description ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: SizedBox(
                      child: Image.network(
                        item?.thumbnail ?? '',
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        16.0.gapH,
      ],
    );
  }
}
