import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final Color backgroundColor;
  final VoidCallback? onTap;
  dynamic child;

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
