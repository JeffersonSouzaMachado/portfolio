import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';

class HeaderName extends StatelessWidget {
  const HeaderName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Row(
        spacing: 20,
        children: [
          Container(
            width: 10,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          AppText(
            "Jefferson Machado",
            color: AppColors.inversePrimary,
            fontSize: 26,
          ),
        ],
      ),
    );
  }
}
