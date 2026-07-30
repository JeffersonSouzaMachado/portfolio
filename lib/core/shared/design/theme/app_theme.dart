import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_theme_extension.dart';

import 'app_colors.dart';
import 'app_radius.dart';

import 'app_typography.dart';

abstract final class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,

      primaryFixed: AppColors.primaryFixed,
      primaryFixedDim: AppColors.primaryFixedDim,
      onPrimaryFixed: AppColors.onPrimaryFixed,
      onPrimaryFixedVariant: AppColors.onPrimaryFixedVariant,

      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,

      secondaryFixed: AppColors.secondaryFixed,
      secondaryFixedDim: AppColors.secondaryFixedDim,
      onSecondaryFixed: AppColors.onSecondaryFixed,
      onSecondaryFixedVariant: AppColors.onSecondaryFixedVariant,

      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,

      tertiaryFixed: AppColors.tertiaryFixed,
      tertiaryFixedDim: AppColors.tertiaryFixedDim,
      onTertiaryFixed: AppColors.onTertiaryFixed,
      onTertiaryFixedVariant: AppColors.onTertiaryFixedVariant,

      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,

      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceDim: AppColors.surfaceDim,
      surfaceBright: AppColors.surfaceBright,

      surfaceContainerLowest:
      AppColors.surfaceContainerLowest,
      surfaceContainerLow:
      AppColors.surfaceContainerLow,
      surfaceContainer:
      AppColors.surfaceContainer,
      surfaceContainerHigh:
      AppColors.surfaceContainerHigh,
      surfaceContainerHighest:
      AppColors.surfaceContainerHighest,

      onSurfaceVariant: AppColors.onSurfaceVariant,

      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,

      shadow: AppColors.primary.withValues(
        alpha: 0.10,
      ),

      scrim: Colors.black,

      inverseSurface: AppColors.inverseSurface,
      onInverseSurface: AppColors.onInverseSurface,
      inversePrimary: AppColors.inversePrimary,

      surfaceTint: AppColors.surfaceTint,
    );

    final textTheme = AppTypography.textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    final inputBorder = OutlineInputBorder(
      borderRadius: AppRadius.borderRegular,
      borderSide: const BorderSide(
        color: AppColors.outlineVariant,
        width: 1,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.primary,
      fontFamily: AppTypography.fontFamily,
      textTheme: textTheme,

      extensions: const <ThemeExtension<dynamic>>[
        LuminaColors.light,
      ],

      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.onSurface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderLg,
          side: const BorderSide(
            color: AppColors.outlineVariant,
            width: 1,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          disabledBackgroundColor: AppColors.surfaceDim,
          disabledForegroundColor:
          AppColors.onSurfaceVariant,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 12,
          ),
          minimumSize: const Size(0, 48),
          textStyle: AppTypography.bodySm.copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.borderRegular,
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 12,
          ),
          minimumSize: const Size(0, 48),
          textStyle: AppTypography.bodySm.copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.borderRegular,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(
            color: AppColors.outlineVariant,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 12,
          ),
          minimumSize: const Size(0, 48),
          textStyle: AppTypography.bodySm.copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.borderRegular,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.secondary,
          textStyle: AppTypography.bodySm.copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.borderRegular,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 14,
        ),
        labelStyle: AppTypography.bodySm.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
        hintStyle: AppTypography.bodySm.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.surfaceDim,
          ),
        ),
        focusedBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 2,
          ),
        ),
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainerLow,
        selectedColor: AppColors.secondaryFixed,
        disabledColor: AppColors.surfaceDim,
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
        ),
        labelStyle: AppTypography.labelSm.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
        secondaryLabelStyle:
        AppTypography.labelSm.copyWith(
          color: AppColors.onSecondaryFixed,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.borderFull,
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor:
        AppColors.surfaceContainerLowest,
        indicatorColor: AppColors.secondaryFixed,
        labelTextStyle: const WidgetStatePropertyAll(
          AppTypography.labelSm,
        ),
      ),

      dialogTheme: const DialogThemeData(
        elevation: 8,
        backgroundColor:
        AppColors.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderXl,
        ),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 8,
        backgroundColor:
        AppColors.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.inverseSurface,
        contentTextStyle: AppTypography.bodySm.copyWith(
          color: AppColors.onInverseSurface,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.borderMd,
        ),
      ),
    );
  }
}