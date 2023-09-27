import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/dots_loader.dart';

class LoadingProgressBar extends StatelessWidget {
  const LoadingProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/apra_logo_small.png"),
            ),
            SizedBox(height: 50, child: LoadingDots())
          ],
        ),
      ),
    );
  }
}
