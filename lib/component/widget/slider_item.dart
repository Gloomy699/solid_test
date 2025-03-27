import 'package:flutter/material.dart';
import 'package:solid_test/component/widget/thumbs_shape.dart';
import 'package:solid_test/resources/constants.dart';

/// A stateless widget that represents a slider item.
///
/// The `SliderItem` widget is used to display a slider with custom
/// thumb and track shapes. It allows the user to adjust the opacity
/// value by sliding the thumb.
///
/// The `currentOpacity` parameter represents the current value of the
/// slider, and the `onChanged` parameter is a callback function that
/// is called when the slider value changes.
class SliderItem extends StatelessWidget {
  /// Creates a `SliderItem` widget.
  ///
  /// The `currentOpacity` parameter is required and represents the
  /// current value of the slider. The `onChanged` parameter is also
  /// required and is a callback function that is called when the slider
  /// value changes.
  const SliderItem({required this.currentOpacity, required this.onChanged});

  /// The current value of the slider.
  final double currentOpacity;

  /// A callback function that is called when the slider value changes.
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: Colors.yellowAccent,
        activeTrackColor: Colors.blue,
        minThumbSeparation: 1,
        thumbShape: ThumbShape(),
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: 6.0,
      ),
      child: Slider(
        max: kMaxSliderValue,
        min: kMinSliderValue,
        value: currentOpacity,
        onChanged: onChanged,
      ),
    );
  }
}
