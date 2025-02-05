import 'package:finonacci_test/domain/entity/fibonacci_item.dart';
import 'package:finonacci_test/domain/repositories/fibonacci_repository.dart';


class FibonacciRepositoryImpl implements FibonacciRepository {
  @override
  List<FibonacciItem> generateFibonacciNumbers(int count) {
    List<FibonacciItem> items = [];
    int a = 0, b = 1;

    items.add(FibonacciItem(number: a, type: _getType(a)));
    if (count > 1) {
      items.add(FibonacciItem(number: b, type: _getType(b)));
    }

    for (int i = 2; i < count; i++) {
      int next = a + b;
      items.add(FibonacciItem(number: next, type: _getType(next)));
      a = b;
      b = next;
    }

    return items;
  }

  String _getType(int number) {
    if (number % 3 == 0) return 'square';
    if (number % 2 == 0) return 'cross';
    return 'circle';
  }

  @override
  List<FibonacciItem> filterByType(String type, List<FibonacciItem> items) {
    return items.where((item) => item.type == type).toList();
  }

  @override
  List<FibonacciItem> highlightItem(int number, List<FibonacciItem> items) {
    return items.map((item) => item.copyWith(
        isHighlighted: item.number == number
    )).toList();
  }
}