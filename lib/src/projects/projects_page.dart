import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/under_construction_warning.dart';

import '../shared/footer.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
