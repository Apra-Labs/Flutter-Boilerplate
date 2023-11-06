import 'package:flutter/material.dart';

/// A widget for displaying large text with various styles.
class Header1 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

  /// Creates a `Header1` widget with a large text size.
  const Header1(
      {super.key,
      required this.title,
      this.textColor,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.w400, color: textColor),
      textAlign: textAlign,
    );
  }
}

/// A widget for displaying medium-sized text with various styles.
class Header2 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

  /// Creates a `Header2` widget with a medium text size.
  const Header2(
      {super.key,
      required this.title,
      this.textColor,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
      textAlign: textAlign,
    );
  }
}

/// A widget for displaying small text with various styles
class Header3 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

  /// Creates a `Header3` widget with a small text size.
  const Header3(
      {super.key,
      required this.title,
      this.textColor,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(color: textColor, fontWeight: FontWeight.w400),
      textAlign: textAlign,
    );
  }
}

/// A widget for displaying medium-sized text with various styles.
class Header4 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

  /// Creates a `Header4` widget with a medium text size.
  const Header4(
      {super.key,
      required this.title,
      this.textColor,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: textColor, fontWeight: FontWeight.w400),
      textAlign: textAlign,
    );
  }
}

/// A widget for displaying medium-sized text with various styles.
class Header5 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

  /// Creates a `Header5` widget with a medium text size.
  const Header5(
      {super.key,
      required this.title,
      this.textColor,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}

/// A widget for displaying small text with various styles.
class Header6 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

  /// Creates a `Header6` widget with a small text size.
  const Header6(
      {super.key,
      required this.title,
      this.textColor,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}
