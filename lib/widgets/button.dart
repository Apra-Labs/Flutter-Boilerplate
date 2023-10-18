import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/button_variants.dart';

class CustomButton extends StatelessWidget {
  final String btnLabel;
  final VoidCallback onClick;
  final ButtonVariant variant;
  final BoxDecoration? borderStyle;

  const CustomButton({
    Key? key,
    required this.btnLabel,
    required this.onClick,
    this.borderStyle,
    this.variant = ButtonVariant.primary, // Default variant is primary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            color: getButtonBackgroundColor(variant, context),
            borderRadius:
                borderStyle?.borderRadius ?? BorderRadius.circular(10.0),
            border: Border.all(
              color: getButtonBorderColor(variant, context),
              width: 1.0,
            ),
          ),
          child: TextButton(
            onPressed: onClick,
            style: TextButton.styleFrom(
              backgroundColor: getButtonBackgroundColor(variant, context),
            ),
            child: Center(
              child: Text(
                btnLabel,
                style: getButtonStyle(
                    variant, context), // Use the style based on the variant
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
