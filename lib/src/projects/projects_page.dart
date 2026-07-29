import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/src/shared/under_construction_warning.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: UnderConstructionWarning())],
      ),
    );
  }
}
