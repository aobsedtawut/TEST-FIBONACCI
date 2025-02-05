import 'package:flutter_test/flutter_test.dart';
import 'package:finonacci_test/data/repositories/fibonacci_impl_repository.dart';

void main() {
  late FibonacciRepositoryImpl repository;

  setUp(() {
    repository = FibonacciRepositoryImpl();
  });

  group('FibonacciRepositoryImpl', () {
    test('generateFibonacciNumbers should return correct sequence', () {
      final result = repository.generateFibonacciNumbers(5);

      expect(result.length, 5);
      expect(result.map((e) => e.number).toList(), [0, 1, 1, 2, 3]);
    });

    test('generateFibonacciNumbers should assign correct types', () {
      final result = repository.generateFibonacciNumbers(5);

      expect(result[0].type, 'square');
      expect(result[1].type, 'circle');
      expect(result[2].type, 'circle');
      expect(result[3].type, 'cross');
      expect(result[4].type, 'square');
    });

    test('filterByType should return only items of specified type', () {
      final items = repository.generateFibonacciNumbers(10);
      final circleItems = repository.filterByType('circle', items);

      expect(
        circleItems.every((item) => item.type == 'circle'),
        true,
      );
    });

    test('highlightItem should highlight only specified number', () {
      final items = repository.generateFibonacciNumbers(5);
      final highlightedItems = repository.highlightItem(2, items);

      expect(
        highlightedItems.where((item) => item.isHighlighted).length,
        1,
      );
      expect(
        highlightedItems.firstWhere((item) => item.isHighlighted).number,
        2,
      );
    });
  });
}