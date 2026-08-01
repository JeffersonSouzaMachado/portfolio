import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/const/local_text_const.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/contacts/widgets/contact_form.dart';
import 'package:portfolio/src/shared/footer.dart';
import 'package:portfolio/src/shared/gradient_container.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

import 'widgets/connectivity_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.gutter),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final size = constraints.maxWidth;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              appText.connectivity.toUpperCase(),
                              color: AppColors.accent,
                              fontSize: 14,
                            ),
                            SizedBox(height: AppSpacing.lg),
                            MarkdownBody(
                              data: appText.letsBuildNextGenerationOfTech,
                              softLineBreak: true,
                              styleSheet: MarkdownStyleSheet(
                                p: AppTypography.headlineXl.copyWith(
                                  color: AppColors.inversePrimary,
                                ),
                                strong: AppTypography.headlineXl.copyWith(
                                  color: AppColors.accent,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSpacing.md),
                            AppText(
                              appText.specializedText,
                              color: AppColors.inversePrimary,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: AppSpacing.xl,
                              ),
                              child: Column(
                                spacing: 30,
                                children: [
                                  //TODO Melhorar esse cara aqui
                                  ConnectivityWidget(
                                    icon: Icons.mail_outline,
                                    label: size < 344
                                        ? null
                                        : appText.writeToMe,
                                    text: size < 344 ? null : email,
                                    isCircle: size < 344 ? true : false,
                                  ),

                                  ConnectivityWidget(
                                    icon: Icons.location_on_sharp,
                                    label: size < 344
                                        ? null
                                        : appText.operationBase,
                                    text: size < 344
                                        ? null
                                        : localOperationBase,
                                    isCircle: size < 344 ? true : false,
                                  ),
                                ],
                              ),
                            ),

                            GradientContainer(
                              width: double.infinity,
                              height: 87,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSpacing.md,
                                  horizontal: AppSpacing.xl,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            appText.readyToJumpIn,
                                            maxLines: 1,
                                            style: AppTypography.headlineMd
                                                .copyWith(
                                                  color:
                                                      AppColors.inversePrimary,
                                                ),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            appText.scheduleAnCall,
                                            maxLines: 1,
                                            style: AppTypography.labelSm
                                                .copyWith(
                                                  color:
                                                      AppColors.inversePrimary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          openExternalURL(
                                            url: calendly,
                                            error:
                                                'Não foi possivel abrir sua agenda',
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.accent,
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Text(
                                                appText.schedule,
                                                maxLines: 1,
                                                style: AppTypography.bodyLg,
                                              ),
                                            ),
                                            Flexible(
                                              child: Icon(Icons.arrow_forward),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(child: ContactForm()),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
