import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class LuminaColors extends ThemeExtension<LuminaColors> {
  const LuminaColors({
    required this.accent,
  });

  final Color accent;

  static const light = LuminaColors(
    accent: AppColors.accent,
  );

  @override
  LuminaColors copyWith({
    Color? accent,
  }) {
    return LuminaColors(
      accent: accent ?? this.accent,
    );
  }

  @override
  LuminaColors lerp(
      covariant LuminaColors? other,
      double t,
      ) {
    if (other == null) {
      return this;
    }

    return LuminaColors(
      accent: Color.lerp(
        accent,
        other.accent,
        t,
      )!,
    );
  }
}

extension LuminaThemeContext on BuildContext {
  LuminaColors get luminaColors {
    return Theme.of(this).extension<LuminaColors>() ??
        LuminaColors.light;
  }
}
