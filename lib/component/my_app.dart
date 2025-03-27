import 'package:flutter/material.dart';
import 'package:solid_test/component/layout/test_layout.dart';

/// The `MyApp` class is the root of the application.
/// It is a stateless widget that sets up the main theme and home page.
class MyApp extends StatelessWidget {
  /// Constructor for the `MyApp` class.
  ///
  /// The `super.key` parameter is used to pass the key to the superclass.
  const MyApp({super.key});

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
