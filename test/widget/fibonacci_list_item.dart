import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finonacci_test/domain/entity/fibonacci_item.dart';
import 'package:finonacci_test/presentation/widgets/fibonacci_list_item.dart';

void main() {
  testWidgets('FibonacciListItem displays correct number and index',
          (tester) async {
        // Arrange
        final item = FibonacciItem(number: 5, type: 'circle');
        var tapCount = 0;

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FibonacciListItem(
                item: item,
                index: 3,
                onTap: () => tapCount++,
              ),
            ),
          ),
        );

        // Assert
        expect(find.text('Index: 3, Number: 5'), findsOneWidget);
      });

  testWidgets('FibonacciListItem shows correct icon for each type',
          (tester) async {
        // Test circle type
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FibonacciListItem(
                item: FibonacciItem(number: 1, type: 'circle'),
                index: 0,
                onTap: () {},
              ),
            ),
          ),
        );
        expect(find.byType(Container), findsWidgets);

        // Test cross type
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FibonacciListItem(
                item: FibonacciItem(number: 2, type: 'cross'),
                index: 0,
                onTap: () {},
              ),
            ),
          ),
        );
        expect(find.byIcon(Icons.close), findsOneWidget);

        // Test square type
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FibonacciListItem(
                item: FibonacciItem(number: 3, type: 'square'),
                index: 0,
                onTap: () {},
              ),
            ),
          ),
        );
        expect(find.byType(Container), findsWidgets);
      });

  testWidgets('FibonacciListItem handles tap correctly', (tester) async {
    // Arrange
    final item = FibonacciItem(number: 5, type: 'circle');
    var tapCount = 0;

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FibonacciListItem(
            item: item,
            index: 3,
            onTap: () => tapCount++,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));

    // Assert
    expect(tapCount, 1);
  });

  testWidgets('FibonacciListItem shows highlight state correctly',
          (tester) async {
        // Arrange
        final item = FibonacciItem(
          number: 5,
          type: 'circle',
          isHighlighted: true,
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FibonacciListItem(
                item: item,
                index: 3,
                onTap: () {},
              ),
            ),
          ),
        );

        // Assert
        final textWidget = tester.widget<Text>(find.byType(Text));
        expect(
          (textWidget.style?.fontWeight ?? FontWeight.normal) == FontWeight.bold,
          true,
        );
      });
}