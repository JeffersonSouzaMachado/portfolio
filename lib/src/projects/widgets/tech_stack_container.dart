import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/projects/widgets/custom_container.dart';
import 'package:portfolio/src/projects/widgets/tech_stack_model.dart';
import 'package:portfolio/src/shared/build_icon.dart';

class TechStackContainer extends StatelessWidget {
  const TechStackContainer({
    super.key,
    required this.stack,
    this.isMobile = false,
  });

  final List<TechStackModel> stack;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Tech Stack',
            style: AppTypography.bodyMd.copyWith(color: AppColors.accent),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisExtent: 80,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: stack.length,
            itemBuilder: (context, index) {
              final item = stack[index];

              return CustomContainer(
                radius: 10,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: .center,
                    spacing: 10,
                    children: [
                      buildIcon(item.icon, color: AppColors.inversePrimary),

                      Text(
                        item.stack,
                        textAlign: TextAlign.center,
                        maxLines: isMobile ? 2 : 1,
                        style: AppTypography.labelMd.copyWith(
                          color: AppColors.inversePrimary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    }

    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Tech Stack',
              style: AppTypography.bodyMd.copyWith(color: AppColors.accent),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: stack.length,
                itemBuilder: (context, index) {
                  final item = stack[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: buildIcon(
                            item.icon,
                            color: AppColors.inversePrimary,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item.stack,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.labelMd.copyWith(
                              color: AppColors.inversePrimary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
