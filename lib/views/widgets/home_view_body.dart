// lib/views/widgets/home_view_body.dart
import 'package:color_tap_app/core/utils/app_strings.dart';
import 'package:color_tap_app/core/utils/app_styles.dart';
import 'package:color_tap_app/views/home_view.dart' show HomeView;
import 'package:flutter/material.dart';

/// A stateless widget that displays the main content of the home view.
///
/// [HomeViewBody] shows a text centered on the screen with a background color.
/// Both the text color and the background color can animate smoothly whenever
/// they change. Tapping anywhere on the widget triggers [onTap].
///
/// This widget is typically used inside [HomeView]
/// where the colors are managed.
class HomeViewBody extends StatelessWidget {
  /// Creates a [HomeViewBody] widget.
  ///
  /// The [backgroundColor], [textColor], and [onTap] parameters are required.
  /// The [duration] and [curve] can be customized to control the animation.
  const HomeViewBody({
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    super.key,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOutCubic,
  });

  /// The current background color of the widget.
  final Color backgroundColor;

  /// The current text color of the widget.
  final Color textColor;

  /// Callback function executed when the widget is tapped.
  final VoidCallback onTap;

  /// Duration of the background and text color animations.
  final Duration duration;

  /// Curve of the background and text color animations.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        color: backgroundColor,
        child: Center(
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: textColor),
            duration: duration,
            curve: curve,
            builder: (context, animatedTextColor, _) {
              return AnimatedDefaultTextStyle(
                duration: duration,
                curve: curve,
                style: AppStyles.font30WhiteBold(
                  context,
                ).copyWith(color: animatedTextColor ?? textColor),
                child: const Text(AppStrings.helloThere),
              );
            },
          ),
        ),
      ),
    );
  }
}
