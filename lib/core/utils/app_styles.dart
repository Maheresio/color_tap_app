import 'package:color_tap_app/core/responsive/responsive_text.dart';
import 'package:flutter/material.dart';

/// A class that holds all static text styles used in the app.
///
/// Using an abstract class prevents instantiation.
abstract class AppStyles {
  /// Returns a responsive [TextStyle] with
  /// font size 30, white color, and bold weight.
  ///
  /// The [context] is used to calculate responsive text size
  /// for different screen dimensions.
  static TextStyle font30WhiteBold(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveTextSize(context, 30),
      fontWeight: FontWeight.bold,
    );
  }
}
