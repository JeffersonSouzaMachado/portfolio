import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/core/shared/asset_type.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/icons/svg_app.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/home/presentation/providers/home_providers.dart';
import 'package:portfolio/src/shared/build_icon.dart';
import 'package:portfolio/src/shared/error_message.dart';
import 'package:portfolio/src/shared/loading_message.dart';
import 'package:portfolio/src/shared/open_external_url.dart';
import 'package:portfolio/src/shared/primary_button.dart';
import 'package:portfolio/src/shared/tech_tag.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;
    final language = Localizations.localeOf(context).languageCode;
    final metrics = ref.watch(metricProvider(language));

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth;
          final isMobile = size < 500;

          return Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.onSecondaryFixedVariant
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(color: AppColors.accent),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: .center,
                                  mainAxisSize: .min,
                                  children: [
                                    Flexible(
                                      child: AppText(
                                        appText.homeDeveloperRole,
                                        maxLines: 2,
                                        color: AppColors.accent,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: MarkdownBody(
                                data: appText.homeHeadline,
                                styleSheet: MarkdownStyleSheet(
                                  p: AppTypography.headlineXl.copyWith(
                                    color: AppColors.onSecondaryContainer,
                                  ),
                                  strong: AppTypography.headlineXl.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: AppText(
                                appText.aboutDescription,
                                color: AppColors.inversePrimary,
                              ),
                            ),

                            Align(
                              alignment: isMobile? Alignment.center : Alignment.centerLeft,
                              child: Wrap(
                                spacing: 20,
                                alignment: WrapAlignment.center,
                                runSpacing: 20,
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
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 50),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: PrimaryButton.filled(
                                        label: appText.viewWorks,
                                        onPressed: () {
                                          context.go(Routes.projects);
                                        },
                                        suffixIcon: Icons.arrow_forward_ios,
                                        backgroundColor: AppColors
                                            .onPrimaryContainer
                                            .withValues(alpha: 0.2),
                                        labelColor: AppColors.inversePrimary,
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 20),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: PrimaryButton.outlined(
                                        label: appText.github,
                                        onPressed: () => openExternalURL(
                                          url: githubProfileURL,
                                          error: appText.cannotOpenExternalUrl,
                                        ),
                                        labelColor: AppColors.inversePrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      isMobile
                          ? SizedBox.shrink()
                          : Expanded(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 520,
                                    height: 520,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        center: Alignment.center,
                                        radius: 0.5,
                                        colors: [
                                          AppColors.primary.withValues(
                                            alpha: 0.08,
                                          ),
                                          AppColors.accent.withValues(
                                            alpha: 0.08,
                                          ),
                                          Colors.transparent,
                                        ],
                                        stops: const [0.0, 0.75, 1.0],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Image.asset(
                                      "assets/images/flutter.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.tabletMargin,
                    ),
                    child: metrics.when(
                      error: (error, stackTrace) {
                        return ErrorMessage(error: error);
                      },
                      loading: () {
                        return LoadingMessage();
                      },
                      data: (metrics) {
                        return Container(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              width: 1,
                              color: AppColors.accent.withValues(alpha: 0.5),
                            ),
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Center(
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: metrics.map((item) {
                                  return SizedBox(
                                    width: 300,
                                    child: Row(
                                      spacing: 10,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: AppColors.secondary
                                                .withValues(alpha: 0.1),
                                            border: BoxBorder.all(
                                              width: 1,
                                              color: AppColors.accent
                                                  .withValues(alpha: 0.3),
                                            ),
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  12,
                                                ),
                                          ),
                                          child: buildIcon(
                                            icon: item.icon,
                                            assetType: AssetType.icon,
                                            color: AppColors.accent,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: .start,
                                            children: [
                                              AppText(
                                                item.title,
                                                color: AppColors.inversePrimary,
                                                fontSize: 26,
                                                fontWeight: .w700,
                                              ),
                                              AppText(
                                                item.text,
                                                color: AppColors.inversePrimary,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
