import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_radius.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/contacts/widgets/contact_form.dart';
import 'package:portfolio/src/shared/footer.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.gutter),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'connectivity'.toUpperCase(),
                            color: AppColors.accent,
                            fontSize: 14,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.xl,
                            ),
                            child: MarkdownBody(
                              data:
                                  'Let\'s build the **next generation** of tech.',
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
                          ),
                          AppText(
                            'I specialize in high-performance mobile architectures and scalable cloud solutions.'
                            ' Reach out to discuss a collaboration, a project, or just to talk tech.',
                            color: AppColors.inversePrimary,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.xl,
                            ),
                            child: Column(
                              spacing: 30,
                              children: [
                                ConnectivityWidget(
                                  icon: Icons.mail_outline,
                                  label: 'Email me',
                                  text: email,
                                ),

                                ConnectivityWidget(
                                  icon: Icons.location_on_sharp,
                                  label: 'Base de Operações',
                                  text: 'São José dos Campos, SP - BR',
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Tooltip(
                                message: "Compartilhe meu Portfolio",
                                waitDuration: const Duration(milliseconds: 100),
                                showDuration: const Duration(seconds: 3),
                                child: ConnectivityWidget(
                                  isCircle: true,
                                  icon: Icons.share_outlined,
                                  iconColor: AppColors.inversePrimary,
                                ),
                              ),

                              Tooltip(
                                message: "Me chama no WhatsApp",
                                waitDuration: const Duration(milliseconds: 100),
                                showDuration: const Duration(seconds: 3),
                                child: ConnectivityWidget(
                                  isCircle: true,
                                  icon: Icons.settings_cell_rounded,
                                  iconColor: AppColors.inversePrimary,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.xl,
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.onTertiary,
                                gradient: RadialGradient(
                                  center: Alignment.topRight,
                                  colors: [
                                    AppColors.onTertiary,
                                    AppColors.onTertiaryContainer.withValues(
                                      alpha: 0.5,
                                    ),
                                  ],
                                ),
                                borderRadius: AppRadius.borderRegular,
                                border: Border.all(
                                  color: AppColors.onPrimary.withValues(
                                    alpha: 0.05,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSpacing.md,
                                  horizontal: AppSpacing.xl
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Ready to jump in?',
                                          style: AppTypography.headlineMd
                                              .copyWith(
                                                color: AppColors.inversePrimary,
                                              ),
                                        ),
                                        Text(
                                          'Schedule a 15-min discovery call.',
                                          style: AppTypography.labelSm.copyWith(
                                            color: AppColors.inversePrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Text(
                                            'Book a Call',
                                            style: AppTypography.bodyLg,
                                          ),
                                          Icon(Icons.arrow_forward),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.accent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: ContactForm()),
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({
    this.icon,
    this.label,
    this.text,
    this.isCircle = false,
    this.iconColor = AppColors.accent,
    super.key,
  });

  final IconData? icon;
  final Color? iconColor;
  final String? label;
  final String? text;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.onTertiary,
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    colors: [
                      AppColors.onTertiary,
                      AppColors.onTertiaryContainer.withValues(alpha: 0.5),
                    ],
                  ),
                  shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  borderRadius: isCircle ? null : AppRadius.borderRegular,
                  border: Border.all(
                    color: AppColors.onPrimary.withValues(alpha: 0.05),
                  ),
                ),
                child: Icon(icon, color: iconColor),
              )
            : SizedBox.shrink(),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label != null
                ? AppText(label!, color: AppColors.inversePrimary, fontSize: 12)
                : SizedBox.shrink(),
            text != null
                ? DefaultSelectionStyle(
                    selectionColor: AppColors.inversePrimary.withValues(
                      alpha: 0.1,
                    ),
                    child: SelectionArea(
                      child: AppText(
                        text!,
                        color: AppColors.inversePrimary,
                        fontSize: 20,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
