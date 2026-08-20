import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/home/presentation/widgets/available_header_tag.dart';
import 'package:portfolio/src/home/presentation/widgets/central_buttons_row.dart';
import 'package:portfolio/src/home/presentation/widgets/gradient_circle_background.dart';
import 'package:portfolio/src/home/presentation/widgets/metric_resume.dart';
import 'package:portfolio/src/home/presentation/widgets/youtube_video.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Center(
              child: videoPresentation(maxVideoWidth: 360),
            ),
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
          Stack(
            children: [
              Positioned(right: 0, top: 10, child: GradientCircleBackground()),
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
                  spacing: 50,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AvailableHeaderTag(appText: appText),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: PageMainText(appText: appText),
                          ),

                          AppText(
                            appText.aboutDescription,
                            color: AppColors.inversePrimary,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: CentralButtonsRow(appText: appText),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisSize: .max,
                        children: [
                          videoPresentation(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

  Widget videoPresentation({double maxVideoWidth = 400}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        YoutubeVideo(
          videoId: selectedVideoId,
          maxWidth: maxVideoWidth,
        ),
        SizedBox(height: AppSpacing.md),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.xs,
          children: [
            for (final language in videoLanguages)
              if (language != selectedVideoLanguage)
                TextButton(
                  onPressed: () {
                    setVideoId(language: language);
                  },
                  child: AppText(
                    videoButtonText(language),
                    color: AppColors.inversePrimary,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
