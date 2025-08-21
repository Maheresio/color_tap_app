import 'package:color_tap_app/core/helper/unique_random_color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UniqueRandomColorGenerator', () {
    UniqueRandomColorGenerator generator = UniqueRandomColorGenerator();
    const int maxColors = 16777216;
    const int testColorsCount = 1000;

    setUp(() {
      generator = UniqueRandomColorGenerator();
    });

    test('should generate a Color', () {
      final color = generator.getRandomColor();
      expect(color, isA<Color>());
    });

    test('should generate unique colors until limit is reached', () {
      final colors = <Color>{};
      for (var i = 0; i < testColorsCount; i++) {
        colors.add(generator.getRandomColor());
      }
      expect(colors.length, testColorsCount);
    });

    test('should reset after MAX_COLORS', () {
      for (var i = 0; i < maxColors; i++) {
        generator.getRandomColor();
      }
      expect(generator.usedColors.isEmpty, true);
    });
  });
}
