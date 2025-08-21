import 'package:flutter/material.dart' show MaterialApp;

/// A class that holds all static string values used in the app.
///
/// Using an abstract class prevents instantiation.
abstract class AppStrings {
  /// The name of the app, used in the [MaterialApp] title.
  static const String appName = 'Color Tap App';

  /// The greeting text shown on the home screen.
  static const String helloThere = 'Hello There';
}
