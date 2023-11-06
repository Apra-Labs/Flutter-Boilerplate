import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/dots_loader.dart';

/// A custom loading progress bar widget that displays a loading animation.
///
/// The `LoadingProgressBar` widget is used to show a loading animation with a logo
/// during asynchronous operations or when waiting for data to load.
///
/// This widget displays an `AlertDialog` with a transparent background and no elevation.
/// Inside the dialog, it shows an image (e.g., a logo) and a series of loading dots
/// provided by the `LoadingDots` widget to indicate a loading process.

class LoadingProgressBar extends StatelessWidget {
  /// Creates a `LoadingProgressBar` widget.
  ///
  /// The [key] is an optional parameter that can be used to identify this widget.
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
