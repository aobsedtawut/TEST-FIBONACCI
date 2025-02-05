import 'package:finonacci_test/presentation/widgets/fibonacci_list_item.dart';
import 'package:finonacci_test/presentation/widgets/filtered_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/fibonacci_repository.dart';
import '../state/fibonacci_state.dart';

class FibonacciPage extends StatefulWidget {
  final FibonacciRepository repository;

  const FibonacciPage({
    required this.repository,
    super.key,
  });

  @override
  State<FibonacciPage> createState() => _FibonacciPageState();
}

class _FibonacciPageState extends State<FibonacciPage> {
  final ScrollController _scrollController = ScrollController();
  late FibonacciState _state;

  @override
  void initState() {
    super.initState();
    _state = FibonacciState(
      allItems: widget.repository.generateFibonacciNumbers(40),
    );
  }

  void _showBottomSheet(String type) {
    final filteredItems = widget.repository.filterByType(type, _state.allItems);

    showModalBottomSheet(
      context: context,
      builder: (context) => FilteredBottomSheet(
        items: filteredItems,
        onItemTap: (item) {
          setState(() {
            _state = _state.copyWith(
              allItems: widget.repository.highlightItem(item.number, _state.allItems),
            );
          });
          Navigator.pop(context);
          _scrollToHighlightedItem(item.number);
        },
      ),
    );
  }

  void _scrollToHighlightedItem(int number) {
    final index = _state.allItems.indexWhere((item) => item.number == number);
    if (index != -1) {
      _scrollController.animateTo(
        index * 60.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fibonacci Numbers'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _state.allItems.length,
        itemBuilder: (context, index) {
          final item = _state.allItems[index];
          return FibonacciListItem(
            item: item,
            index: index,
            onTap: () => _showBottomSheet(item.type),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}