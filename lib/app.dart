import 'package:flutter/material.dart';
import 'package:solid_test/component/layout/test_layout.dart';

/// The `App` class is the root of the application.
/// It is a stateless widget that sets up the main theme and home page.
class App extends StatelessWidget {
  /// Constructor for the `App` class.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TestLayout(),
    );
  }
}
