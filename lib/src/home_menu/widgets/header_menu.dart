import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';

import 'package:portfolio/src/home_menu/widgets/header_menu_model.dart';

class HeaderMenu extends ConsumerStatefulWidget {
  const HeaderMenu({
    super.key,
    required this.menuItems,
    required this.screenSize,
  });

  final List<HeaderMenuModel> menuItems;
  final double screenSize;

  @override
  ConsumerState<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends ConsumerState<HeaderMenu> {
  int? hoveredIndex;
  double buttonWidth = 120;
  double underlineWidth = 60;

  double iconWidth = 50;
  double underlineIconWidth = 25;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    final currentIndex = widget.menuItems.indexWhere(
      (item) => item.route == currentRoute,
    );

    final selectedIndex =
        hoveredIndex ?? (currentIndex == -1 ? 0 : currentIndex);
    final routeIndex = widget.menuItems.indexWhere(
      (item) => item.route == currentRoute,
    );

    final activeIndex = routeIndex == -1 ? 0 : routeIndex;

    return Row(
      children: [
        if (widget.screenSize <= 647)
          menuItem(
            selectedIndex: selectedIndex,
            width: iconWidth,
            underline: underlineIconWidth,
            activeIndex: activeIndex,
            showIcon: true,
          )
        else
          menuItem(
            selectedIndex: selectedIndex,
            width: buttonWidth,
            underline: underlineWidth,
            activeIndex: activeIndex,
          ),
      ],
    );
  }

  Widget menuItem({
    required int selectedIndex,
    required double width,
    required double underline,
    required int activeIndex,
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
              color: selectedIndex == activeIndex
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
