import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_spacings.dart';
import 'package:portfolio/core/theme/app_text.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/widgets/header_menu.dart';
import 'package:portfolio/src/widgets/header_menu_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          width: 1000,
          height: size.height,
          decoration: BoxDecoration(
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: 0.05),
                blurRadius: 12,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.lg,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final size = constraints.maxWidth;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'theDevJeff',
                          color: AppColors.inversePrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        HeaderMenu(
                          screenSize: size,
                          menuItems: [
                            HeaderMenuModel(
                              title: appText.home,
                              icon: LucideIcons.home,
                            ),
                            HeaderMenuModel(
                              title: appText.projects,
                              icon: LucideIcons.briefcaseBusiness,
                            ),
                            HeaderMenuModel(
                              title: appText.skills,
                              icon: LucideIcons.crown,
                            ),
                            HeaderMenuModel(
                              title: appText.contact,
                              icon: LucideIcons.userSearch,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Divider(color: AppColors.secondary.withValues(alpha: 0.2)),
            ],
          ),
        ),
      ),
    );
  }
}
