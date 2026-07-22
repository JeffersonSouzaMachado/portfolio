import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text.dart';
import 'package:portfolio/src/widgets/header_menu_model.dart';

class HeaderMenu extends StatefulWidget {
  const HeaderMenu({
    super.key,
    required this.menuItems,
    required this.screenSize,
  });

  final List<HeaderMenuModel> menuItems;
  final double screenSize;

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  int currentIndex = 0;
  int? hoveredIndex;
  double buttonWidth = 120;
  double underlineWidth = 60;

  double iconWidth = 50;
  double underlineIconWidth = 25;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = hoveredIndex ?? currentIndex;

    if (widget.screenSize <= 647) {
      return menuItem(
        selectedIndex: selectedIndex,
        width: iconWidth,
        underline: underlineIconWidth,
        showIcon: true,
      );
    }

    return menuItem(
      selectedIndex: selectedIndex,
      width: buttonWidth,
      underline: underlineWidth,
    );
  }

  Widget menuItem({
    required int selectedIndex,
    required double width,
    required double underline,
    bool showIcon = false,
  }) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.menuItems.length, (index) {
            final item = widget.menuItems[index];

            return MouseRegion(
              onEnter: (_) {
                setState(() => hoveredIndex = index);
              },
              onExit: (_) {
                setState(() => hoveredIndex = null);
              },
              child: SizedBox(
                width: width,
                child: TextButton(
                  onPressed: () {
                    setState(() => currentIndex = index);
                    context.go(item.route);
                  },
                  child: showIcon
                      ? Icon(item.icon, color: AppColors.inversePrimary)
                      : AppText(item.title, color: AppColors.inversePrimary),
                ),
              ),
            );
          }),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
          left: (selectedIndex * width) + ((width - underline) / 2),
          bottom: 0,
          child: Container(
            width: underline,
            height: 2,
            decoration: BoxDecoration(
              color: selectedIndex == currentIndex
                  ? AppColors.secondary
                  : AppColors.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
