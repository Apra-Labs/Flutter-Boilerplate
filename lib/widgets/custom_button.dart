import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnLabel;
  final VoidCallback onClick;
  final double? buttonWidth;
  final double? buttonHeight;
  final TextStyle? style; //todo: theming support
  final BoxDecoration? borderStyle;

  const CustomButton({
    Key? key,
    required this.btnLabel,
    required this.onClick,
    this.style,
    this.buttonWidth,
    this.buttonHeight,
    this.borderStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
        child: SizedBox(
            width: buttonWidth ?? screenWidth * 0.8,
            child: Container(
                constraints: BoxConstraints(minHeight: buttonHeight ?? 55.0),
                decoration: BoxDecoration(
                    color: style?.backgroundColor,
                    borderRadius: borderStyle?.borderRadius ??
                        BorderRadius.circular(30.0),
                    border: Border.all(
                        color: borderStyle?.color ?? Colors.black, width: 1.0)),
                child: TextButton(
                  onPressed: onClick,
                  child: Center(
                    child: Text(
                      btnLabel,
                      style: style ??
                          TextStyle(
                            color: style?.color,
                            fontSize: style?.fontSize,
                            fontWeight: style?.fontWeight,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))));
  }
}
