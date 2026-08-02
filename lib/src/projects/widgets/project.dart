import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/icons/images_app.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/projects/widgets/project_model.dart';
import 'package:portfolio/src/shared/footer.dart';

class Project extends StatelessWidget {
  const Project({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 610,
                    child: Stack(
                      children: [
                        Image.asset(ImagesApp.helpneiMainLogo),
                        Positioned(
                          top: 400,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, AppColors.primary],
                                stops: const [0.0, 0.5],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 450,
                          left: 20,
                          right: 20,

                          child: Column(
                            mainAxisAlignment: .start,
                            crossAxisAlignment: .start,
                            spacing: 20,
                            children: [
                              Text(
                                project.companyName,
                                style: AppTypography.headlineLg.copyWith(
                                  color: AppColors.accent,
                                ),
                              ),
                              Text(
                                project.shortDescription,
                                style: AppTypography.bodyMd.copyWith(
                                  color: AppColors.inversePrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      project.shortDescription,
                      style: AppTypography.bodyMd.copyWith(color: AppColors.inversePrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Footer(),
      ],
    );
  }
}
