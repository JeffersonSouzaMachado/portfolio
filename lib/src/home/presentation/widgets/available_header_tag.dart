import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class AvailableHeaderTag extends StatelessWidget {
  const AvailableHeaderTag({super.key, required this.appText});

  final AppLocalizations appText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onSecondaryFixedVariant.withValues(alpha: 0.1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: AppColors.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Flexible(
              child: AppText(
                appText.homeDeveloperRole,
                maxLines: 2,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
