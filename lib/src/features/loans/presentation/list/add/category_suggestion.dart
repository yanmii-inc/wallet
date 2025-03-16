import 'package:flutter/material.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';

class CategorySuggestion extends StatelessWidget {
  const CategorySuggestion(this.categories, {super.key, this.onPressed});
  final List<CategoryEntity>? categories;
  final void Function(CategoryEntity)? onPressed;

  @override
  Widget build(BuildContext context) {
    if (categories?.isEmpty ?? true) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h4,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categories!
              .map(
                (category) => ActionChip(
                  padding: const EdgeInsets.all(4),
                  label: Text(
                    category.label,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onPressed: () => onPressed?.call(category),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
