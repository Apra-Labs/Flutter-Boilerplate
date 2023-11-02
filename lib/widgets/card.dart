import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

class AppCard extends StatelessWidget {
  final Variant variant;
  final Widget body;
  final double? padding;
  final double? borderRadius;
  final double? elevation;
  final Color? color;

  const AppCard(
      {Key? key,
      required this.body,
      this.padding,
      this.elevation,
      this.color,
      this.variant = Variant.light,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VariantStyle style = getVariantStyle(variant);
    return Card(
      elevation: elevation ?? 5,
      color: color ?? style.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 10),
        child: body,
      ),
    );
  }
}
