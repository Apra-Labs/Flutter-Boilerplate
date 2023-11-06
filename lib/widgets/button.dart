import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/button_variants.dart';

/// A custom button widget that can be styled with different variants.
///
/// The `CustomButton` widget provides a customizable button that supports various visual variants.
/// You can specify the button's label, an `onClick` callback, and its visual appearance by choosing
/// from different `ButtonVariant` options.

class CustomButton extends StatelessWidget {
  /// The label to be displayed on the button.
  final String btnLabel;

  /// A callback function that is invoked when the button is pressed.
  final VoidCallback onClick;

  /// The visual appearance of the button, defined by a `ButtonVariant`.
  final ButtonVariant variant;

  /// The optional custom border style for the button.
  final BoxDecoration? borderStyle;

  /// Creates a `CustomButton` widget.
  ///
  /// The [btnLabel] is the label to be displayed on the button.
  /// The [onClick] callback is triggered when the button is pressed.
  /// The [variant] defines the visual appearance of the button and is based on a `ButtonVariant`.
  /// The optional [borderStyle] allows you to customize the border of the button.

  const CustomButton({
    Key? key,
    required this.btnLabel,
    required this.onClick,
    this.borderStyle,
    this.variant = ButtonVariant.primary, // Default variant is primary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonVariantStyle style = getButtonVariantStyle(variant, context);
    return Center(
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius:
                borderStyle?.borderRadius ?? BorderRadius.circular(10.0),
            border: Border.all(
              color: style.borderColor,
              width: 1.0,
            ),
          ),
          child: TextButton(
            onPressed: onClick,
            style: TextButton.styleFrom(
              backgroundColor: style.backgroundColor,
            ),
            child: Center(
              child: Text(
                btnLabel,
                style: style.textStyle, // Use the style based on the variant
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
