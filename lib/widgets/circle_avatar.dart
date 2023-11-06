import 'package:flutter/material.dart';

/// A customizable circular avatar widget.
///
/// The `CustomCircleAvatar` widget provides a circular avatar with customizable properties.
/// You can specify the [radius] of the avatar, the [backgroundColor], and the [child] widget or content to be displayed within the avatar.
/// Additionally, you can provide an optional [onTap] callback that is invoked when the avatar is tapped.

// ignore: must_be_immutable
class CustomCircleAvatar extends StatelessWidget {
  /// The radius of the circular avatar.
  final double radius;

  /// The background color of the circular avatar.
  final Color backgroundColor;

  /// The widget or content to be displayed within the circular avatar.
  dynamic child;

  /// A callback function that is invoked when the avatar is tapped.
  final VoidCallback? onTap;

  /// Creates a `CustomCircleAvatar` widget.
  ///
  /// The [radius] parameter specifies the size of the circular avatar.
  /// The [backgroundColor] parameter defines the background color of the avatar.
  /// The [child] parameter represents the content or widget to be displayed within the circular avatar.
  /// The optional [onTap] parameter allows you to specify a callback that is triggered when the avatar is tapped.
  CustomCircleAvatar({
    super.key,
    required this.radius,
    required this.backgroundColor,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: child,
      ),
    );
  }
}
