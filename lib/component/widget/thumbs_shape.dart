import 'package:flutter/material.dart';

/// A custom shape for the thumb of a slider.
class ThumbShape extends SliderComponentShape {
  /// The radius of the thumb.
  static const _thumbRadius = 16.0;

  /// The scale factor for the inner thumb radius.
  static const _innerThumbsRadiusScaleFactor = 2;

  /// The color of the outer thumb.
  static const Color _outerThumbColor = Colors.blueAccent;

  /// The color of the inner thumb.
  static const Color _innerThumbColor = Colors.yellowAccent;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(_thumbRadius, _thumbRadius);

  /// Paints the thumb shape on the canvas.
  ///
  /// This method overrides an abstract method from `SliderComponentShape`.
  /// The parameters are required by the `SliderComponentShape` interface.
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
