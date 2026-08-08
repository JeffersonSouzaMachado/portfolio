import 'dart:ui';

import 'package:portfolio/core/shared/design/theme/app_colors.dart';

abstract final class AppColorMapper {
  AppColorMapper(String color);

  static Color color(String key) {
    return switch (key) {
      'seconday' => AppColors.secondary,
      'accent' => AppColors.accent,
      'secondaryFixedDim' => AppColors.secondaryFixedDim,
      'errorContainer' => AppColors.errorContainer,
      _ => AppColors.inversePrimary,
    };
  }
}
