
import 'package:finonacci_test/presentation/pages/fibonacci_page.dart';
import 'package:flutter/material.dart';

import 'data/repositories/fibonacci_impl_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Clean Architecture',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FibonacciPage(
        repository: FibonacciRepositoryImpl(),
      ),
    );
  }
}