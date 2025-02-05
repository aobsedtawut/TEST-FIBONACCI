import 'package:flutter/material.dart';
import '../../domain/entity/fibonacci_item.dart';

class FibonacciListItem extends StatelessWidget {
  final FibonacciItem item;
  final int index;
  final VoidCallback onTap;

  const FibonacciListItem({
    required this.item,
    required this.index,
    required this.onTap,
    super.key,
  });

  Widget _buildIcon(String type) {
    switch (type) {
      case 'circle':
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black87,
            border: Border.all(color: Colors.black87),
          ),
        );
      case 'cross':
        return const Icon(
          Icons.close,
          size: 20,
          color: Colors.black87,
        );
      case 'square':
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87),
          ),
        );
      default:
        return const SizedBox(width: 20, height: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: item.isHighlighted ? Colors.blue.withOpacity(0.1) : null,
          border: item.isHighlighted
              ? Border.all(color: Colors.blue.withOpacity(0.3))
              : null,
          borderRadius: item.isHighlighted
              ? BorderRadius.circular(8)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Index: $index, Number: ${item.number}',
              style: TextStyle(
                fontSize: 14,
                color: item.isHighlighted ? Colors.blue : Colors.black87,
                fontWeight: item.isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            _buildIcon(item.type),
          ],
        ),
      ),
    );
  }
}