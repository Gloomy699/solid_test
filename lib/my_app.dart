import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solid_test/resources/constants.dart';

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
      home: const MyHomePage(),
    );
  }
}

/// The `MyHomePage` class represents the home page of the application.
/// It is a stateful widget that maintains the state of the counter.
class MyHomePage extends StatefulWidget {
  /// Constructor for the `MyHomePage` class.

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// The `_MyHomePageState` class is the state associated with
/// the `MyHomePage` widget.
/// It manages the state of the counter and updates the UI accordingly.
class _MyHomePageState extends State<MyHomePage> {
  double _currentOpacity = kMaxSliderValue;
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Text(
                  kWishText,
                  style: TextStyle(fontSize: 36, color: invertedTextColor),
                ),
              ),
              ColoredBox(
                color: _backgroundColor,
                child: Column(
                  children: [
                    const Spacer(),
                    AnimatedOpacity(
                      opacity: invertedOpacity,
                      duration: kAnimationDuration,
                      child: Text(
                        kHeyText,
                        style: TextStyle(
                          fontSize: 30,
                          color: invertedTextColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      kChangeText,
                      style: TextStyle(fontSize: 24, color: invertedTextColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.yellowAccent,
                          activeTrackColor: Colors.blue,
                          minThumbSeparation: 1,
                          thumbShape: _ThumbShape(),
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 6.0,
                        ),
                        child: Slider(
                          max: kMaxSliderValue,
                          min: kMinSliderValue,
                          value: _currentOpacity,
                          onChanged: _changeOpacity,
                        ),
                      ),
                    ),
                    Text(
                      '${_currentOpacity.round()} $kOpacityText',
                      style: TextStyle(fontSize: 20, color: invertedTextColor),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double get invertedOpacity =>
      (_currentOpacity - kMinSliderValue) / (kMaxSliderValue - kMinSliderValue);

  Color get invertedTextColor {
    return Color.fromARGB(
      kMaxSliderValue.round(),
      (kMaxRGBValue - _backgroundColor.r * kMaxRGBValue).round(),
      (kMaxRGBValue - _backgroundColor.g * kMaxRGBValue).round(),
      (kMaxRGBValue - _backgroundColor.b * kMaxRGBValue).round(),
    );
  }

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        _currentOpacity.round(),
        Random().nextInt(kMaxRGBValue),
        Random().nextInt(kMaxRGBValue),
        Random().nextInt(kMaxRGBValue),
      );
    });
  }

  void _changeOpacity(double opacity) {
    setState(() {
      _currentOpacity = opacity;
      _backgroundColor = _backgroundColor.withValues(
        alpha: opacity / kMaxSliderValue,
      );
    });
  }
}

class _ThumbShape extends SliderComponentShape {
  static const _thumbRadius = 16.0;
  static const _innerThumbsRadiusScaleFactor = 2;
  static const Color _outerThumbColor = Colors.blueAccent;
  static const Color _innerThumbColor = Colors.yellowAccent;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(_thumbRadius, _thumbRadius);

  /// Since the paint method implements an abstract method from
  /// SliderComponentShape, the parameters cannot be removed.
  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    context.canvas
      ..drawCircle(center, _thumbRadius, Paint()..color = _outerThumbColor)
      ..drawCircle(
        center,
        _thumbRadius / _innerThumbsRadiusScaleFactor,
        Paint()..color = _innerThumbColor,
      );
  }
}
