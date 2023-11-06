import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

/// A custom circular progress indicator with styling options.
///
/// The `CircularProgress` widget allows you to create circular progress indicators
/// with custom styles to match your application's visual theme. It provides the
/// [variant] property to specify the visual style, and an optional [size] to set
/// the dimensions of the circular progress indicator.

class CircularProgress extends StatelessWidget {
  final Variant variant;
  final double? size;

  /// Creates a `CircularProgress` widget.
  ///
  /// The [variant] is used to apply a custom visual style to the circular progress indicator.
  /// The [size] is an optional parameter to set the dimensions of the circular progress indicator.

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
