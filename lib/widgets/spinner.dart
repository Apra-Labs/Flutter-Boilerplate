import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

class CircularProgress extends StatelessWidget {
  final Variant variant;
  final double? size;

  const CircularProgress(
      {super.key, this.size, this.variant = Variant.primary});

  @override
  Widget build(BuildContext context) {
    VariantStyle style = getVariantStyle(variant);
    return SizedBox(
      width: size ?? 40,
      height: size ?? 40,
      child: CircularProgressIndicator(
        strokeWidth: 4.0,
        valueColor: AlwaysStoppedAnimation<Color>(style.backgroundColor),
      ),
    );
  }
}
