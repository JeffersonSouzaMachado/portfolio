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
import 'package:portfolio/src/shared/gradient_container.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

import 'widgets/connectivity_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(AppSpacing.gutter),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth;

          if (size < 550) {
            return mobile(appText: appText, size: size);
          }

          return desktop(appText: appText, size: size);
        },
      ),
    );
  }

  Widget mobile({required AppLocalizations appText, required double size}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          description(appText: appText, size: size),


          ContactForm(),
        ],
      ),
    );
  }

  Widget desktop({required AppLocalizations appText, required double size}) {
    return Row(
      children: [
        Expanded(
          child: description(appText: appText, size: size),
        ),
        SizedBox(width: 50),
        Expanded(child: ContactForm()),
      ],
    );
  }

  Widget description({
    required AppLocalizations appText,
    required double size,
  }) {
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
        AppText(appText.specializedText, color: AppColors.inversePrimary),

        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: Column(
            spacing: 30,
            children: [
              //TODO Melhorar esse cara aqui
              ConnectivityWidget(
                icon: Icons.mail_outline,
                label: size < 344 ? null : appText.writeToMe,
                text: size < 344 ? null : email,
                isCircle: size < 344 ? true : false,
              ),

              ConnectivityWidget(
                icon: Icons.location_on_sharp,
                label: size < 344 ? null : appText.operationBase,
                text: size < 344 ? null : localOperationBase,
                isCircle: size < 344 ? true : false,
              ),
            ],
          ),
        ),

        Padding(
          padding:  EdgeInsets.only(bottom: AppSpacing.xl),
          child: GradientContainer(
            width: double.infinity,
            height: size < 550 ? 150 : 87,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.md,
                horizontal: AppSpacing.xl,
              ),
              child: size < 550
                  ? Column(children: scheduleContainer(appText: appText))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: scheduleContainer(appText: appText),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> scheduleContainer({required AppLocalizations appText}) {
    return [
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appText.readyToJumpIn,
              maxLines: 1,
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.inversePrimary,
              ),
            ),
            SizedBox(height: 6),
            Text(
              appText.scheduleAnCall,
              maxLines: 1,
              style: AppTypography.labelSm.copyWith(
                color: AppColors.inversePrimary,
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
              error: 'Não foi possivel abrir sua agenda',
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            padding: EdgeInsets.zero,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  appText.schedule,
                  maxLines: 1,
                  style: AppTypography.bodyLg,
                ),
              ),
              Flexible(child: Icon(Icons.arrow_forward)),
            ],
          ),
        ),
      ),
    ];
  }
}
