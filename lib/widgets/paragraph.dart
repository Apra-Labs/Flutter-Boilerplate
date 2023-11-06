import 'package:flutter/material.dart';

/// A customizable paragraph of text with various styling options.
///
/// The `Paragraph` widget provides a flexible text paragraph that can be customized
/// with options such as [text], [textColor], [fontSize], [fontWeight], and [textAlign].

class Paragraph extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  /// Creates a `Paragraph` widget.
  ///
  /// The [key] is an optional parameter that can be used to identify this widget.
  /// The [text] is the text content to be displayed in the paragraph.
  /// The [textColor] is the color of the text.
  /// The [fontSize] is the font size of the text.
  /// The [fontWeight] is the font weight of the text.
  /// The [textAlign] is the alignment of the text within the paragraph.
  const Paragraph({
    super.key,
    required this.text,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize),
      textAlign: textAlign,
    );
  }
}
