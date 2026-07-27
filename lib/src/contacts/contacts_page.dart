import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_radius.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/contacts/widgets/form_contact_field.dart';
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
                  Expanded(child: Container()),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.onTertiary,
                        gradient: RadialGradient(
                          center: Alignment.topRight,
                          colors: [
                            AppColors.onTertiary,
                            AppColors.onTertiaryContainer.withValues(alpha: 0.5),
                          ],
                        ),
                        borderRadius: AppRadius.borderXl,
                        border: Border.all(
                          color: AppColors.onPrimary.withValues(alpha: 0.05),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.gutter,
                          vertical: AppSpacing.xl,
                        ),
                        child: Form(
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: AppSpacing.lg,
                              children: [
                                Row(
                                  spacing: AppSpacing.md,
                                  children: [
                                    Flexible(
                                      child: FormContactField(
                                        label: appText.labelName,
                                        hintText: "John",
                                      ),
                                    ),
                                    Flexible(
                                      child: FormContactField(
                                        label: appText.labelLastName,
                                        hintText: "Doe",
                                      ),
                                    ),
                                  ],
                                ),
                                FormContactField(
                                  label: appText.labelEmail,
                                  hintText: "john@company.com",
                                ),
                                FormContactField(
                                  label: appText.labelSubject,
                                  hintText: appText.subjectText,
                                ),
                                FormContactField(
                                  label: appText.labelProjectDetails,
                                  hintText: appText.projectsDetailsText,
                                  height: 150,
                                ),

                                SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.onPrimaryContainer
                                          .withValues(alpha: 0.2),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: AppText(
                                            appText.sendMessage,
                                            maxLines: 1,
                                            color: AppColors.inversePrimary,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.send,
                                          color: AppColors.inversePrimary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  appText.agreeText,
                                  style: AppTypography.bodySm.copyWith(
                                    color: AppColors.inversePrimary,
                                    fontSize: 11,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
