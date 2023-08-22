import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnLabel;
  final VoidCallback onClick;
  final TextStyle? style;

  const CustomButton({
    Key? key,
    required this.btnLabel,
    required this.onClick,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8;

    return Center(
        child: SizedBox(
            width: buttonWidth, //need to take from props
            child: Container(
                constraints: const BoxConstraints(minHeight: 55.0),
                decoration: BoxDecoration(
                    color: style?.backgroundColor,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.black, width: 1.0)),
                child: TextButton(
                  onPressed: onClick,
                  child: Center(
                    child: Text(
                      btnLabel,
                      style: TextStyle(
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
