import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/home_menu/widgets/header_menu.dart';
import 'package:portfolio/src/home_menu/widgets/header_menu_model.dart';
import 'package:portfolio/src/shared/header_name.dart';

class HomeMenuPage extends StatefulWidget {
  const HomeMenuPage({super.key, required this.child});

  final Widget child;

  @override
  State<HomeMenuPage> createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SizedBox(
          width: 1500,
          height: size.height,

          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth;

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderName(),
                      HeaderMenu(
                        screenSize: size,
                        menuItems: [
                          HeaderMenuModel(
                            title: appText.home,
                            icon: LucideIcons.home,
                            route: Routes.home,
                          ),
                          HeaderMenuModel(
                            title: appText.projects,
                            icon: LucideIcons.briefcaseBusiness,
                            route: Routes.projects,
                          ),
                          HeaderMenuModel(
                            title: appText.experience,
                            icon: LucideIcons.crown,
                            route: Routes.skills,
                          ),
                          HeaderMenuModel(
                            title: appText.contact,
                            icon: LucideIcons.userSearch,
                            route: Routes.contact,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              Expanded(child: widget.child),
            ],
          ),
        ),
      ),
    );
  }
}
