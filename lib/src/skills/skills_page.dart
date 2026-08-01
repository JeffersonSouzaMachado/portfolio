import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/under_construction_warning.dart';

import '../../core/shared/design/theme/app_colors.dart';
import '../shared/footer.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: UnderConstructionWarning()),
        LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.maxWidth;
            bool isMobile = false;

            if (size < 550) {
              isMobile = true;
            }

            return Footer(isMobile: isMobile);
          },
        ),
      ],
    );
  }
}
