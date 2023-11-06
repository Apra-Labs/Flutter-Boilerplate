import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

/// A customizable card widget with different visual variants.
///
/// The `AppCard` widget provides a card that can be styled with different visual variants.
/// You can customize the card's content, padding, elevation, color, border radius, and visual appearance
/// using the [body], [padding], [elevation], [color], [borderRadius], and [variant] parameters.

class AppCard extends StatelessWidget {
  /// The visual appearance of the card, defined by a `Variant`.
  final Variant variant;

  /// The content to be displayed inside the card.
  final Widget body;

  /// The amount of padding around the card's content. If not specified, it defaults to 10.
  final double? padding;

  /// The elevation of the card, which adds a shadow. If not specified, it defaults to 5.
  final double? elevation;

  /// The background color of the card. If not specified, it uses the color defined by the `variant`.
  final Color? color;

  /// The border radius of the card. If not specified, it defaults to 15.
  final double? borderRadius;

  /// Creates an `AppCard` widget.
  ///
  /// The [body] parameter specifies the content to be displayed inside the card.
  /// The optional [padding] parameter defines the padding around the card's content (default is 10).
  /// The optional [elevation] parameter sets the elevation level of the card (default is 5).
  /// The optional [color] parameter allows you to specify a custom background color for the card.
  /// The [variant] parameter defines the visual appearance of the card and is based on a `Variant`.
  /// The optional [borderRadius] parameter sets the border radius of the card (default is 15).

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
