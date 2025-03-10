import 'package:flutter/material.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';

class NameSuggestion extends StatelessWidget {
  const NameSuggestion(this.names, {super.key, this.onPressed});
  final List<String> names;
  final void Function(String)? onPressed;
  @override
  Widget build(BuildContext context) {
    if (names.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h4,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: names
              .map(
                (name) => ActionChip(
                  padding: const EdgeInsets.all(4),
                  label: Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onPressed: () => onPressed?.call(name),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
