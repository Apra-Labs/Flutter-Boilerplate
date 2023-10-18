import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

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

class Header2 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

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

class Header3 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

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

class Header4 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

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

class Header5 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

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

class Header6 extends StatelessWidget {
  final String title;
  final Color? textColor;
  final TextAlign? textAlign;

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
