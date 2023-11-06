import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';
import 'dart:math';

enum DotType { square, circle, diamond, icon }

/// An animated widget to display loading dots with customizable properties.
class LoadingDots extends StatefulWidget {
  /// The color of the first loading dot.
  final Color dotOneColor;

  /// The color of the second loading dot.
  final Color dotTwoColor;

  /// The color of the third loading dot.
  final Color dotThreeColor;

  /// The duration for one complete loading animation cycle.
  final Duration duration;

  /// The type of loading dots to display (square, circle, diamond, or icon).
  final DotType dotType;

  /// The icon to use for loading dots when `dotType` is set to `DotType.icon`.
  final Icon dotIcon;

  /// The radius of each loading dot.
  final double radius;

  /// Creates a `LoadingDots` widget with customizable loading dots animation.
  const LoadingDots(
      {super.key,
      this.dotOneColor = AppColorsPalette.primary,
      this.dotTwoColor = AppColorsPalette.primary,
      this.dotThreeColor = AppColorsPalette.primary,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.circle,
      this.dotIcon = const Icon(Icons.blur_on),
      this.radius = 15});

  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {
        //print(animation_1.value);
      });
    });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: (animation_1.value <= 0.4
              ? 2.5 * animation_1.value
              : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_1.value)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius,
              color: widget.dotOneColor,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Opacity(
          opacity: (animation_2.value <= 0.4
              ? 2.5 * animation_2.value
              : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_2.value)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius,
              color: widget.dotTwoColor,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Opacity(
          opacity: (animation_3.value <= 0.4
              ? 2.5 * animation_3.value
              : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_3.value)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius,
              color: widget.dotThreeColor,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
      ],
    );
  }
}

/// A single loading dot widget with customizable properties.
class Dot extends StatelessWidget {
  /// The radius of the loading dot.
  final double radius;

  /// The color of the loading dot.
  final Color? color;

  /// The type of loading dot to display (circle, square, diamond, or icon).
  final DotType type;

  /// The icon to use for the loading dot when `type` is set to `DotType.icon`.
  final Icon icon;

  /// Creates a `Dot` widget with customizable loading dot properties.
  const Dot(
      {super.key,
      required this.radius,
      this.color,
      required this.type,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon
          ? Icon(
              icon.icon,
              color: color,
              size: 1.3 * radius,
            )
          : Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    color: color,
                    shape: type == DotType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ),
    );
  }
}
