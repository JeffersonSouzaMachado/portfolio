import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/projects/domain/entities/project_entity.dart';
import 'package:portfolio/src/projects/presentation/mappers/project_asset_mapper.dart';

import '../../../../core/shared/design/theme/app_colors.dart';
import '../../../../core/shared/design/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/project_model.dart';


class ShowCaseApp extends StatelessWidget {
  const ShowCaseApp({super.key, required this.project});

  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return InkWell(
      onTap: () {
        context.go('/project', extra: project);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.1)),
        ),
        child: Column(
          spacing: 15,
          mainAxisAlignment: .start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(ProjectAssetMapper.image(project.cardImage)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                project.shortCompanyName,
                style: AppTypography.labelMd.copyWith(
                  color: AppColors.accent,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                project.shortDescription,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.inversePrimary,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    appText.seeMore,
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.accent,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: AppColors.accent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}