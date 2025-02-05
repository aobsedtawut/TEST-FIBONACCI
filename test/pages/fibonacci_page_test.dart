import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finonacci_test/domain/entity/fibonacci_item.dart';
import 'package:finonacci_test/domain/repositories/fibonacci_repository.dart';
import 'package:finonacci_test/presentation/pages/fibonacci_page.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<FibonacciRepository>()])
import 'fibonacci_page_test.mocks.dart';

void main() {
  late MockFibonacciRepository mockRepository;

  setUp(() {
    mockRepository = MockFibonacciRepository();
  });

  testWidgets('FibonacciPage should display list of numbers', (tester) async {
    // Arrange
    final testItems = [
      FibonacciItem(number: 0, type: 'circle'),
      FibonacciItem(number: 1, type: 'circle'),
      FibonacciItem(number: 1, type: 'circle'),
    ];

    when(mockRepository.generateFibonacciNumbers(40))
        .thenReturn(testItems);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: FibonacciPage(repository: mockRepository),
      ),
    );

    // Assert
    expect(find.text('Index: 0, Number: 0'), findsOneWidget);
    expect(find.text('Index: 1, Number: 1'), findsOneWidget);
    expect(find.text('Index: 2, Number: 1'), findsOneWidget);
  });

  testWidgets('Tapping item should show bottom sheet', (tester) async {
    // Arrange
    final testItems = [
      FibonacciItem(number: 0, type: 'circle'),
      FibonacciItem(number: 1, type: 'circle'),
    ];

    when(mockRepository.generateFibonacciNumbers(40))
        .thenReturn(testItems);
    when(mockRepository.filterByType('circle', testItems))
        .thenReturn(testItems);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: FibonacciPage(repository: mockRepository),
      ),
    );

    await tester.tap(find.text('Index: 0, Number: 0'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(ListView), findsNWidgets(2)); // Main list and bottom sheet
  });

  testWidgets('Tapping bottom sheet item should highlight main list item',
          (tester) async {
        // Arrange
        final testItems = [
          FibonacciItem(number: 0, type: 'circle'),
          FibonacciItem(number: 1, type: 'circle'),
        ];

        final highlightedItems = testItems.map((item) =>
            item.copyWith(isHighlighted: item.number == 0)).toList();

        when(mockRepository.generateFibonacciNumbers(40))
            .thenReturn(testItems);
        when(mockRepository.filterByType('circle', testItems))
            .thenReturn(testItems);
        when(mockRepository.highlightItem(0, testItems))
            .thenReturn(highlightedItems);

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: FibonacciPage(repository: mockRepository),
          ),
        );

        await tester.tap(find.text('Index: 0, Number: 0'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Index: 0, Number: 0').last);
        await tester.pumpAndSettle();

        // Assert
        verify(mockRepository.highlightItem(0, testItems)).called(1);
      });
}