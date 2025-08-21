import 'dart:math';
import 'package:flutter/material.dart';

/// A helper class that generates unique random colors.
///
/// The generator ensures that the same color is not repeated
/// until all possible colors have been used (up to 16,777,216 colors).
class UniqueRandomColorGenerator {
  /// Maximum number of unique colors (256^3 for RGB).
  static const int maxColors = 16777216;

  /// The maximum value for each RGB color channel (red, green, blue)
  /// when generating random colors.
  /// This value is exclusive, meaning valid channel values range from 0 to 255.
  static const int maxRgbValue = 256; // for random

  /// The maximum value for the alpha (opacity) channel
  /// in ARGB color representation.
  /// Represents full opacity.
  static const int maxAlpha = 255;

  /// Random number generator.
  final Random _random;

  /// Keeps track of already generated colors to avoid duplicates.
  final Set<Color> usedColors;

  /// Creates a new [UniqueRandomColorGenerator] instance.
  UniqueRandomColorGenerator() : _random = Random(), usedColors = <Color>{};

  /// Returns a new random [Color].
  ///
  /// Ensures uniqueness until all possible colors are used.
  /// Clears the used set automatically when all colors are generated.
  Color getRandomColor() {
    Color color;
    do {
      color = Color.fromARGB(
        maxAlpha,
        _random.nextInt(maxRgbValue),
        _random.nextInt(maxRgbValue),
        _random.nextInt(maxRgbValue),
      );
    } while (usedColors.contains(color));

    usedColors.add(color);

    if (usedColors.length == maxColors) {
      usedColors.clear();
    }

    return color;
  }
}
