import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';
import 'package:flutter_boilerplate/themes/button_variants.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/widgets/button.dart';

class Alert extends StatelessWidget {
  final Variant variant;
  final String title;
  final String message;
  final AlignmentGeometry? titleAlignment;
  final Widget? body;
  final TextStyle? titleTextStyle;
  final String acceptLabel;
  final String denyLabel;
  final Function onAccept;
  final Function onDeny;

  const Alert({
    Key? key,
    required this.title,
    required this.message,
    required this.onAccept,
    required this.onDeny,
    this.titleTextStyle,
    this.titleAlignment,
    this.body,
    this.acceptLabel = Texts.acceptLabel,
    this.denyLabel = Texts.closeLabel,
    this.variant = Variant.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VariantStyle style = getVariantStyle(variant);
    return AlertDialog(
      backgroundColor: style.backgroundColor,
      title: Align(
        alignment: titleAlignment ?? Alignment.center,
        child: Text(title, style: titleTextStyle ?? style.textStyle),
      ),
      contentPadding: const EdgeInsets.all(20.0),
      content: SingleChildScrollView(
        child: GestureDetector(
          child: Column(
            children: [
              Text(message, style: style.textStyle),
              body ?? Container(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    btnLabel: denyLabel,
                    onClick: () {
                      onDeny();
                      Navigator.of(context).pop();
                    },
                    variant: ButtonVariant.outlineLight,
                  ),
                  CustomButton(
                    btnLabel: acceptLabel,
                    onClick: () {
                      onAccept();
                      Navigator.of(context).pop();
                    },
                    variant: ButtonVariant.outlineLight,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
