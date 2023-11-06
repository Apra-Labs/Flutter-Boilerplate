import 'package:flutter/material.dart';

/// A custom app bar widget that provides a customizable app bar for the application.
///
/// The `CustomAppBar` widget offers a flexible app bar implementation that allows you to
/// customize the app bar's appearance and functionality. It can display an optional image
/// or a title and an optional action button.

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The optional image path to be displayed as part of the app bar.
  final String? imagePath;

  /// The callback function to be invoked when the action button is pressed.
  final VoidCallback onClick;

  /// Determines whether to show the action button on the app bar.
  final bool showActionButton;

  /// The optional title widget to be displayed in the app bar.
  final Widget? title;

  /// The icon to be used for the action button.
  final IconData iconName;

  /// Creates a `CustomAppBar` widget.
  ///
  /// The [onClick] callback is required for handling the action button's press event.
  /// The [showActionButton] property controls the visibility of the action button.
  /// The [iconName] property sets the icon to be used for the action button.
  const CustomAppBar({
    super.key,
    this.imagePath,
    required this.onClick,
    this.showActionButton = true,
    this.iconName = Icons.close,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        title: title ?? const Text(""),
        //  imagePath.isNotEmpty
        //     ? Container(
        //         width: 68,
        //         height: 68,
        //         decoration: BoxDecoration(
        //           color: Colors.black,
        //           borderRadius: BorderRadius.circular(10),
        //           border: Border.all(
        //             color: Colors.grey,
        //             width: 1,
        //           ), // Add border radius
        //         ),
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(10), // Add border radius
        //           child: Image.asset(
        //             imagePath,
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       )
        //     : null,
        actions: [
          // PopupMenuButton(itemBuilder: (BuildContext context) {
          //   return [
          //     const PopupMenuItem(child: Text('Share')),
          //     const PopupMenuItem(child: Text('Upload')),
          //     const PopupMenuItem(child: Text('Exit'))
          //   ];
          // })
          Visibility(
            visible: showActionButton,
            child: IconButton(
              onPressed: onClick,
              icon: Icon(
                iconName,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
