import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';
import 'package:flutter_boilerplate/themes/button_variants.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/widgets/button.dart';

/// The `Alert` widget is a customizable alert dialog that allows you to display
/// messages, a title, and action buttons. It provides options for customizing
/// the appearance and behavior of the alert.
///
/// Example usage:
///
/// ```dart
/// Alert(
///   title: 'Confirmation',
///   message: 'Are you sure you want to continue?',
///   onAccept: () {
///     // Handle the user's acceptance action here.
///   },
///   onDeny: () {
///     // Handle the user's denial action here.
///   },
///   acceptLabel: 'Accept',
///   denyLabel: 'Deny',
///   variant: Variant.primary,
/// )
/// ```
class Alert extends StatelessWidget {
  /// The variant style to be used for the alert's appearance.
  final Variant variant;

  /// The title of the alert dialog.
  final String title;

  /// The message to be displayed in the alert dialog.
  final String message;

  /// The alignment of the title within the alert dialog.
  final AlignmentGeometry? titleAlignment;

  /// The custom body widget to be displayed below the message.
  final Widget? body;

  /// The text style for the title.
  final TextStyle? titleTextStyle;

  /// The label for the accept (confirm) button.
  final String acceptLabel;

  /// The label for the deny (cancel) button.
  final String denyLabel;

  /// The callback function to be invoked when the accept button is pressed.
  final Function onAccept;

  /// The callback function to be invoked when the deny button is pressed.
  final Function onDeny;

  /// Creates an `Alert` widget.
  ///
  /// The [title] and [message] are required properties, while the rest are
  /// optional and provide default values.
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
