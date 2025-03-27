import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solid_test/component/widget/slider_item.dart';
import 'package:solid_test/resources/constants.dart';

/// The `TestLayout` class represents the home page of the application.
/// It is a stateful widget that maintains the state of the counter.
class TestLayout extends StatefulWidget {
  /// Constructor for the `TestLayout` class.

  const TestLayout({super.key});

  @override
  State<TestLayout> createState() => _TestLayoutState();
}

/// The `_TestLayoutState` class is the state associated with
/// the `TestLayout` widget.
/// It manages the state of the counter and updates the UI accordingly.
class _TestLayoutState extends State<TestLayout> {
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
                      child: SliderItem(
                        currentOpacity: _currentOpacity,
                        onChanged: _changeOpacity,
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

  Color get invertedTextColor => Color.fromARGB(
    kMaxSliderValue.round(),
    (kMaxRGBValue - _backgroundColor.r * kMaxRGBValue).round(),
    (kMaxRGBValue - _backgroundColor.g * kMaxRGBValue).round(),
    (kMaxRGBValue - _backgroundColor.b * kMaxRGBValue).round(),
  );

  void _changeColor() => setState(
    () =>
        _backgroundColor = Color.fromARGB(
          _currentOpacity.round(),
          Random().nextInt(kMaxRGBValue),
          Random().nextInt(kMaxRGBValue),
          Random().nextInt(kMaxRGBValue),
        ),
  );

  void _changeOpacity(double opacity) => setState(() {
    _currentOpacity = opacity;
    _backgroundColor = _backgroundColor.withValues(
      alpha: opacity / kMaxSliderValue,
    );
  });
}
