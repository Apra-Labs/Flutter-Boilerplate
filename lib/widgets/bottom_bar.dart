import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';

/// A custom bottom app bar widget for displaying a row of selectable items.
///
/// The `CustomBottomBar` widget provides a customizable bottom app bar for the application,
/// allowing you to render a row of items with optional labels. You can specify the selected
/// color for the active item.
class CustomBottomBar extends StatelessWidget {
  /// The list of items to be displayed in the bottom app bar.
  final List<BottomBarItem> items;

  /// The index of the currently selected item.
  final int selectedIndex;

  /// A callback function that is invoked when an item is selected.
  final ValueChanged<int>? onItemSelected;

  /// Creates a `CustomBottomBar` widget.
  ///
  /// The [items] list contains the items to be displayed in the bottom app bar.
  /// The [selectedIndex] specifies the index of the currently selected item.
  /// The optional [onItemSelected] callback is triggered when an item is selected.
  const CustomBottomBar({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            BottomBarItem item = items[index];

            return GestureDetector(
              onTap: () {
                if (onItemSelected != null) {
                  onItemSelected!(index);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: index == selectedIndex ? item.selectedColor : null,
                    size: item.iconSize,
                  ),
                  if (item.label != null)
                    Text(
                      item.label!,
                      style: TextStyle(
                        color:
                            index == selectedIndex ? item.selectedColor : null,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A data class representing an item in the `CustomBottomBar`.
///
/// The `BottomBarItem` class represents an item that can be displayed in the `CustomBottomBar`.
class BottomBarItem {
  /// The icon to be displayed for the item.
  final IconData icon;

  /// The optional label to be displayed beneath the icon.
  final String? label;

  /// The color for the item when it's selected.
  final Color selectedColor;

  // final Color unselectedColor;

  /// The size of the item's icon.
  final double iconSize;

  /// Creates a `BottomBarItem`.
  ///
  /// The [icon] property specifies the icon to be displayed for the item.
  /// The optional [label] provides a label beneath the icon.
  /// The [selectedColor] is the color used when the item is selected.
  /// The [iconSize] determines the size of the icon.
  BottomBarItem({
    required this.icon,
    this.label,
    this.selectedColor = AppColorsPalette.danger,
    // this.unselectedColor = Colors.grey,
    this.iconSize = 30.0,
  });
}
