import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/router/routes.dart';
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
  final OverlayPortalController _controller = OverlayPortalController();

  int? hoveredIndex;

  final double buttonWidth = 120;
  final double underlineWidth = 60;

  final double iconWidth = 50;
  final double underlineIconWidth = 25;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    int routeIndex = 0;

    if (currentRoute == Routes.project) {
      routeIndex = 1;
    } else {
      routeIndex = widget.menuItems.indexWhere(
        (item) => item.route == currentRoute,
      );
    }

    final activeIndex = routeIndex == -1 ? 0 : routeIndex;
    final selectedIndex = hoveredIndex ?? activeIndex;

    return Row(
      children: [
        if (widget.screenSize < 550)
          _mobileMenu()
        else if (widget.screenSize <= 647)
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

  Widget _mobileMenu() {
    return OverlayPortal(
      controller: _controller,
      overlayChildBuilder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _controller.hide,
                child: Container(color: Colors.black.withValues(alpha: 0.35)),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Material(
                color: AppColors.primary,
                elevation: 12,
                child: SafeArea(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            tooltip: 'Fechar menu',
                            onPressed: _controller.hide,
                            icon: Icon(
                              Icons.close,
                              color: AppColors.inversePrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...widget.menuItems.map(_mobileMenuItem),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: IconButton(
        tooltip: 'Abrir menu',
        onPressed: _controller.toggle,
        icon: Icon(Icons.menu, color: AppColors.inversePrimary),
      ),
    );
  }

  Widget _mobileMenuItem(HeaderMenuModel item) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final isActive = currentRoute == item.route;

    return ListTile(
      leading: Icon(
        item.icon,
        color: isActive ? AppColors.secondary : AppColors.inversePrimary,
      ),
      title: AppText(
        item.title,
        color: isActive ? AppColors.secondary : AppColors.inversePrimary,
      ),
      selected: isActive,
      onTap: () {
        _controller.hide();

        if (!isActive) {
          context.go(item.route);
        }
      },
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
