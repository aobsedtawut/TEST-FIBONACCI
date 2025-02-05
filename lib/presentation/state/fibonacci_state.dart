import 'package:finonacci_test/domain/entity/fibonacci_item.dart';

class FibonacciState {
  final List<FibonacciItem> allItems;
  final List<FibonacciItem> filteredItems;
  final bool isLoading;
  final String? error;

  FibonacciState({
    required this.allItems,
    this.filteredItems = const [],
    this.isLoading = false,
    this.error,
  });

  FibonacciState copyWith({
    List<FibonacciItem>? allItems,
    List<FibonacciItem>? filteredItems,
    bool? isLoading,
    String? error,
  }) {
    return FibonacciState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}