import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? imagePath;
  final VoidCallback onClick;
  final bool showActionButton;
  // final Color? bgColor;
  // final Color? actionButtonColor;
  final Widget? title;
  final IconData iconName;

  const CustomAppBar({
    super.key,
    this.imagePath,
    required this.onClick,
    this.showActionButton = true,
    // this.bgColor = Colors.transparent,
    // this.actionButtonColor = Colors.black,
    this.iconName = Icons.close,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        // backgroundColor: bgColor,
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
          Visibility(
            visible: showActionButton,
            child: IconButton(
              onPressed: onClick,
              // color: actionButtonColor,
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
