import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double? size;
  final Color? color;

  const CircularProgress({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 40,
      height: size ?? 40,
      child: CircularProgressIndicator(
        strokeWidth: 4.0,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.amber),
      ),
    );
  }
}
