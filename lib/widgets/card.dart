import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';

class AppCard extends StatelessWidget {
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
      this.color = AppColors.light,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 5,
      color: color,
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
