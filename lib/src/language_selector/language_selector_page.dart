import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import '../../core/shared/localization/locale_enum.dart';
import '../../core/shared/localization/locale_provider.dart';

class LanguageSelectorPage extends ConsumerStatefulWidget {
  const LanguageSelectorPage({super.key});

  @override
  ConsumerState<LanguageSelectorPage> createState() =>
      _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends ConsumerState<LanguageSelectorPage> {
  int? hoveredIndex;
  final languageLocales = const [Locale('pt'), Locale('en')];

  void setAppLanguage(int index) {
    final locale = languageLocales[index];

    ref.read(localeProvider.notifier).state = locale;
  }

  String languageTextByLocale(Locale locale) {
    final localizations = lookupAppLocalizations(locale);

    return locale.languageCode == AppLocale.pt.name
        ? localizations.portuguese
        : localizations.english;
  }

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
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
              children: List.generate(languageLocales.length, (index) {
                final item = languageTextByLocale(languageLocales[index]);
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
                        setAppLanguage(index);
                      },
                      onPressed: () {
                        setAppLanguage(index);
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
                          fontWeight: isHovered
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: isHovered ? 20 : 16,
                        ),
                        child: AppText(item, color: AppColors.inversePrimary),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
