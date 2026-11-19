import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/core/shared/localization/locale_enum.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/language_selector/locale_provider.dart';

class LanguageSelectorPage extends ConsumerStatefulWidget {
  const LanguageSelectorPage({super.key});

  @override
  ConsumerState<LanguageSelectorPage> createState() =>
      _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends ConsumerState<LanguageSelectorPage> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          if (maxWidth < 550) {
            return mobile();
          } else {
            return desktop();
          }
        },
      ),
    );
  }

  Widget mobile() {
    final appText = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.xl),
          child: AnimatedDefaultTextStyle(
            curve: Curves.bounceIn,
            duration: Duration(milliseconds: 250),
            style: AppTypography.headlineXl,
            child: AppText(
              appText.selectLanguage,
              color: AppColors.inversePrimary,
              fontSize: 30,
            ),
          ),
        ),

        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 30,
            children: [...languageList()],
          ),
        ),
      ],
    );
  }

  Widget desktop() {
    final appText = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.xl),
          child: AnimatedDefaultTextStyle(
            curve: Curves.bounceIn,
            duration: Duration(milliseconds: 250),
            style: AppTypography.headlineXl,
            child: AppText(
              appText.selectLanguage,
              color: AppColors.inversePrimary,
              fontSize: 30,
            ),
          ),
        ),

        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [...languageList()],
          ),
        ),
      ],
    );
  }

  List<Widget> languageList() {
    return List.generate(AppLocale.values.length, (index) {
      final item = AppLocale.values[index];
      final isHovered = hoveredIndex == index;

      return Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: hoveredIndex == index ? 220 : 180,
          height: hoveredIndex == index ? 60 : 50,
          child: ElevatedButton(
            onHover: (isHovering) {
              setState(() {
                hoveredIndex = isHovering ? index : null;
              });
              ref.read(localeProvider.notifier).setLocale(item.locale);
            },
            onPressed: () {
              ref.read(localeProvider.notifier).setLocale(item.locale);
              context.go(Routes.home);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary.withValues(
                alpha: isHovered ? 0.2 : 0.1,
              ),
              elevation: isHovered ? 8 : 2,
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              style: TextStyle(
                fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                fontSize: isHovered ? 20 : 16,
              ),
              child: AppText(item.name, color: AppColors.inversePrimary),
            ),
          ),
        ),
      );
    });
  }
}
