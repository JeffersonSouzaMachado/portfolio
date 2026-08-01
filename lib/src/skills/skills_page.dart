import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/under_construction_warning.dart';

import '../../core/shared/design/theme/app_colors.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: UnderConstructionWarning())],
      ),
    );
  }
}
