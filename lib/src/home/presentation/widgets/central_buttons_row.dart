import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/open_external_url.dart';
import 'package:portfolio/src/shared/primary_button.dart';

class CentralButtonsRow extends StatelessWidget {
  const CentralButtonsRow({super.key, required this.appText});

  final AppLocalizations appText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60,
          width: 300,
          child: PrimaryButton.filled(
            label: appText.viewWorks,
            onPressed: () {
              context.go(Routes.projects);
            },
            suffixIcon: Icons.arrow_forward_ios,
            backgroundColor: AppColors.onPrimaryContainer.withValues(
              alpha: 0.2,
            ),
            labelColor: AppColors.inversePrimary,
          ),
        ),

        SizedBox(width: 20),
        SizedBox(
          height: 60,
          width: 300,
          child: PrimaryButton.outlined(
            label: appText.github,
            onPressed: () => openExternalURL(
              url: githubProfileURL,
              error: appText.cannotOpenExternalUrl,
            ),
            labelColor: AppColors.inversePrimary,
          ),
        ),
      ],
    );
  }
}
