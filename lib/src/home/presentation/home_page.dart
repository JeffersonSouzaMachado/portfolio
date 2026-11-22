import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/shared/design/icons/svg_app.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/home/presentation/widgets/available_header_tag.dart';
import 'package:portfolio/src/home/presentation/widgets/central_buttons_row.dart';
import 'package:portfolio/src/home/presentation/widgets/gradient_circle_background.dart';
import 'package:portfolio/src/home/presentation/widgets/metric_resume.dart';
import 'package:portfolio/src/shared/page_main_text.dart';
import 'package:portfolio/src/shared/footer.dart';

import '../../../core/shared/const/external_urls_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const videoLanguages = ['en', 'pt', 'es'];

  String selectedVideoId = englishIntroductionVideo;
  bool didSetInitialVideo = false;
  String selectedVideoLanguage = 'en';

  void setVideoId({required String language}) {
    final normalizedLanguage = normalizeVideoLanguage(language);
    final videoId = videoIdForLanguage(normalizedLanguage);

    if (selectedVideoLanguage == normalizedLanguage) return;

    setState(() {
      selectedVideoLanguage = normalizedLanguage;
      selectedVideoId = videoId;
    });
  }

  String normalizeVideoLanguage(String language) {
    return videoLanguages.contains(language) ? language : 'en';
  }

  String videoIdForLanguage(String language) {
    return switch (language) {
      'pt' => portugueseIntroductionVideo,
      'es' => spanishIntroductionVideo,
      _ => englishIntroductionVideo,
    };
  }

  String videoButtonText(String language) {
    return switch (language) {
      'pt' => 'Veja em Português',
      'es' => 'Ver en Español',
      _ => 'See in English',
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (didSetInitialVideo) return;

    selectedVideoLanguage = normalizeVideoLanguage(
      Localizations.localeOf(context).languageCode,
    );
    selectedVideoId = videoIdForLanguage(selectedVideoLanguage);
    didSetInitialVideo = true;
  }

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          if (maxWidth < 550) {
            return mobile(appText);
          } else {
            return desktop(appText);
          }
        },
      ),
    );
  }

  Widget mobile(AppLocalizations appText) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              AppSpacing.xxl,
              AppSpacing.xl,
              0,
            ),
            child: AvailableHeaderTag(appText: appText),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
              horizontal: AppSpacing.xl,
            ),
            child: PageMainText(appText: appText),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: AppText(
              appText.aboutDescription,
              color: AppColors.inversePrimary,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
              horizontal: AppSpacing.xl,
            ),
            child: CentralButtonsRow(appText: appText),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xxl,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            child: Center(child: MetricResume()),
          ),

          Footer(isMobile: true),
        ],
      ),
    );
  }

  Widget desktop(AppLocalizations appText) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              AppSpacing.xxl,
              AppSpacing.xl,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 100,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvailableHeaderTag(appText: appText),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: PageMainText(appText: appText),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: AppText(
                          appText.aboutDescription,
                          color: AppColors.inversePrimary,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: .start,
                        spacing: 20,
                        children: [
                          techTag(
                            icon: SvgApp.cleanArch,
                            technology: "Clean Arch",
                          ),
                          techTag(
                            icon: SvgApp.infinitySymbol,
                            technology: "CI/CD",
                            color: AppColors.secondary,
                          ),
                          techTag(
                            icon: SvgApp.firebaseLogo,
                            technology: "Firebase",
                          ),
                          techTag(
                            icon: SvgApp.scalableSymbol,
                            technology: "Scalability",
                            color: AppColors.secondary,
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: CentralButtonsRow(appText: appText),
                      ),
                    ],
                  ),
                ),

                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    GradientCircleBackground(),
                    SizedBox(
                      width: 500,
                      child: Image.asset("assets/images/flutter.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xxl,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            child: MetricResume(),
          ),
          Footer(),
        ],
      ),
    );
  }

  Widget techTag({
    required String icon,
    required String technology,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.1),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          spacing: 10,
          children: [
            SizedBox(height: 26, child: SvgPicture.asset(icon, color: color)),
            AppText(technology, color: AppColors.inversePrimary, fontSize: 18),
          ],
        ),
      ),
    );
  }
}
