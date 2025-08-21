// lib/views/home_view.dart
import 'package:color_tap_app/core/helper/unique_random_color_generator.dart';
import 'package:color_tap_app/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

/// A StatefulWidget that displays a home screen with a text and
/// a background color that changes on each tap.
///
/// The [HomeView] uses [UniqueRandomColorGenerator] to generate
/// random colors for the background and the text. Colors do not repeat
/// until all possible colors have been generated.
class HomeView extends StatefulWidget {
  /// Creates a [HomeView] widget.
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UniqueRandomColorGenerator _colorGenerator =
      UniqueRandomColorGenerator();

  /// The current background color of the screen.
  Color _backgroundColor = Colors.white; // temporary default
  /// The current text color of the screen.
  Color _textColor = Colors.black; // temporary default

  @override
  void initState() {
    super.initState();
    _backgroundColor = _colorGenerator.getRandomColor();
    _textColor = _colorGenerator.getRandomColor();
  }

  /// Changes the background and text colors to new random values.
  ///
  /// This method is called on every tap on the screen.
  void _shuffleColors() {
    setState(() {
      _backgroundColor = _colorGenerator.getRandomColor();
      _textColor = _colorGenerator.getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(
        backgroundColor: _backgroundColor,
        textColor: _textColor,
        onTap: _shuffleColors,
      ),
    );
  }
}
