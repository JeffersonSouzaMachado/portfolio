import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text.dart';

class HeaderMenu extends StatefulWidget {
  const HeaderMenu({super.key, required this.menuItems});

  final List<String> menuItems;

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  int currentIndex = 0;
  int? hoveredIndex;
  double buttonWidth = 120;
  double underlineWidth = 60;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = hoveredIndex ?? currentIndex;

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

                print(index);
              },
              onExit: (_) {
                setState(() => hoveredIndex = null);
                print('null');
              },
              child: SizedBox(
                width: buttonWidth,
                child: TextButton(
                  onPressed: () {
                    setState(() => currentIndex = index);
                  },
                  child: AppText(item, color: AppColors.inversePrimary),
                ),
              ),
            );
          }),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
          left:
              (selectedIndex * buttonWidth) +
              ((buttonWidth - underlineWidth) / 2),
          bottom: 0,
          child: Container(
            width: underlineWidth,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
