import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

class FormContactField extends StatelessWidget {
  const FormContactField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.height = 50,
  });

  final String label;
  final double height;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

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
        TextSelectionTheme(
          data: TextSelectionThemeData(
            selectionColor: AppColors.inversePrimary.withValues(alpha: 0.15),
            cursorColor: AppColors.inversePrimary,
            selectionHandleColor: AppColors.inversePrimary,
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            minLines: height > 50 ? 5 : 1,
            maxLines: height > 50 ? 8 : 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.inversePrimary,
            ),
            textAlignVertical: TextAlignVertical.top,
            enableInteractiveSelection: true,
            cursorColor: AppColors.inversePrimary,
            keyboardType: height > 50
                ? TextInputType.multiline
                : TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.primary,
              hintText: hintText,
              hintStyle: AppTypography.bodySm,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.inversePrimary.withValues(alpha: 0.05),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.inversePrimary,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
