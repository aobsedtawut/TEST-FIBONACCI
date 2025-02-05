import 'package:finonacci_test/domain/entity/fibonacci_item.dart';

abstract class FibonacciRepository {
  List<FibonacciItem> generateFibonacciNumbers(int count);
  List<FibonacciItem> filterByType(String type, List<FibonacciItem> items);
  List<FibonacciItem> highlightItem(int number, List<FibonacciItem> items);
}