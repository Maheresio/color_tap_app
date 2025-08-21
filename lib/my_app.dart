import 'package:color_tap_app/core/utils/app_strings.dart';
import 'package:color_tap_app/views/home_view.dart';
import 'package:flutter/material.dart';

/// The root widget of the Color Tap App.
///
/// [MyApp] sets up the [MaterialApp] and defines [HomeView] as the
/// home screen. It also disables the debug banner and sets the app title.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /// The main screen of the app.
      home: HomeView(),

      /// Hides the debug banner in the top-right corner.
      debugShowCheckedModeBanner: false,

      /// The title of the app, used by the OS.
      title: AppStrings.appName,
    );
  }
}
