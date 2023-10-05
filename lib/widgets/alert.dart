import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/widgets/custom_button.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';

class Alert extends StatelessWidget {
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      title: Align(
          alignment: titleAlignment ?? Alignment.center, child: Text(title)),
      titleTextStyle: titleTextStyle,
      contentPadding: const EdgeInsets.all(20.0),
      content: SingleChildScrollView(
        child: GestureDetector(
          child: Column(
            children: [
              Text(message),
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
                    buttonWidth: screenWidth * 0.2,
                    buttonHeight: screenHeight * 0.04,
                    style: const TextStyle(
                      color: AppColors.dark,
                      backgroundColor: AppColors.light,
                      fontSize: FontSize.medium,
                    ),
                    borderStyle: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.dark),
                  ),
                  CustomButton(
                    btnLabel: acceptLabel,
                    onClick: () {
                      onDeny();
                      Navigator.of(context).pop();
                    },
                    buttonWidth: screenWidth * 0.2,
                    buttonHeight: screenHeight * 0.04,
                    style: const TextStyle(
                      color: AppColors.dark,
                      backgroundColor: AppColors.positive,
                      fontSize: FontSize.medium,
                    ),
                    borderStyle: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.dark),
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
