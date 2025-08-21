import 'package:flutter/material.dart';

/// Calculates a responsive text size based on the device screen dimensions.
///
/// [context] is required to get the current screen size.
/// [baseSize] is the reference font size based on a baseline screen (375x812).
double getResponsiveTextSize(BuildContext context, double baseSize) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final double screenHeight = MediaQuery.of(context).size.height;

  const double baselineWidth = 375;
  const double baselineHeight = 812;

  final double widthScaleFactor = screenWidth / baselineWidth;
  final double heightScaleFactor = screenHeight / baselineHeight;

  // Use the smaller scale factor to ensure text fits both width and height
  final double scaleFactor = widthScaleFactor < heightScaleFactor
      ? widthScaleFactor
      : heightScaleFactor;

  return baseSize * scaleFactor;
}
