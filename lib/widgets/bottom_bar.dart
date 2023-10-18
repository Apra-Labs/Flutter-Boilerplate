import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme.dart';

class CustomBottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;

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

class BottomBarItem {
  final IconData icon;
  final String? label;
  final Color selectedColor;
  // final Color unselectedColor;
  final double iconSize;

  BottomBarItem({
    required this.icon,
    this.label,
    this.selectedColor = AppColors.danger,
    // this.unselectedColor = Colors.grey,
    this.iconSize = 30.0,
  });
}
