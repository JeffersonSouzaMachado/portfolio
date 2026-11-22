import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/core/shared/localization/locale_enum.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/language_selector/locale_provider.dart';
import 'package:portfolio/src/shared/header_name.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          return Center(
            child: SizedBox(
              width: 1500,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  HeaderName(),

                  Expanded(
                    child: Stack(
                      children: [
                        buildCircle(
                          top: maxHeight * 0.0,
                          left: maxWidth * 0.20,
                        ),
                        // buildCircle(top: maxHeight * 0.15, left: maxWidth * 0.50),
                        buildCircle(
                          top: maxHeight * 0.55,
                          left: maxWidth * 0.55,
                        ),

                        if (maxWidth < 550) mobile() else desktop(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 450,
        height: 450,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.5,
            colors: [
              AppColors.secondary.withValues(alpha: 0.1), // Centro

              Colors.transparent, // Bordas
            ],
            stops: [0.0, 1.0],
          ),
        ),
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
          width: hoveredIndex == index ? 220 : 200,
          height: hoveredIndex == index ? 70 : 60,
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
              side: BorderSide(
                color: AppColors.secondary.withValues(alpha: 0.1),
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(18),
              ),
            ),

            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              style: TextStyle(
                fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                fontSize: isHovered ? 20 : 16,
              ),
              child: AppText(
                item.name,
                color: AppColors.inversePrimary,
                fontSize: isHovered ? 20 : 16,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget styledButton() {
    return ElevatedButton(onPressed: () {}, child: null);
  }
}
