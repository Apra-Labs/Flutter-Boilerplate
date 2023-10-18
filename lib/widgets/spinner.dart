import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme.dart';

class CircularProgress extends StatelessWidget {
  //changing name
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
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.warning),
      ),
    );
  }
}
