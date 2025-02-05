import 'package:finonacci_test/presentation/widgets/fibonacci_list_item.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entity/fibonacci_item.dart';

class FilteredBottomSheet extends StatelessWidget {
  final List<FibonacciItem> items;
  final Function(FibonacciItem) onItemTap;

  const FilteredBottomSheet({
    required this.items,
    required this.onItemTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return FibonacciListItem(
          index: index,
          item: item,
          onTap: () => onItemTap(item),
        );
      },
    );
  }
}