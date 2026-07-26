import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

class FormContactField extends StatelessWidget {
  const FormContactField({
    super.key,
    required this.label,
    required this.hintText,
    this.height = 50,
  });

  final String label;
  final double height;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            label,
            style: AppTypography.labelSm.copyWith(
              color: AppColors.outlineVariant,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: height,
          child: TextFormField(
            minLines: null,
            maxLines: null,
            expands: height > 50 ? true : false,
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.inversePrimary,
            ),
            textAlignVertical: TextAlignVertical.top,
            enableInteractiveSelection: true,
            cursorColor: AppColors.inversePrimary,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              fillColor: AppColors.primary,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.inversePrimary.withValues(alpha: 0.05),
                  width: 1,
                ),
              ),
              hintText: hintText,
              hintStyle: AppTypography.bodySm,
            ),
          ),
        ),
      ],
    );
  }
}
