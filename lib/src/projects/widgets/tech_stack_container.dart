import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/projects/widgets/custom_container.dart';
import 'package:portfolio/src/projects/widgets/tech_stack_model.dart';

class TechStackContainer extends StatelessWidget {
  const TechStackContainer({super.key, required this.stack});

  final List<TechStackModel> stack;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 300,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Tech Stack',
              style: AppTypography.bodyMd.copyWith(color: AppColors.accent),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
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
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              color: AppColors.inversePrimary,
                              size: 15,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            item.stack,
                            style: AppTypography.labelMd.copyWith(
                              color: AppColors.inversePrimary,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
