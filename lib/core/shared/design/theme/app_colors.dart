import 'package:flutter/material.dart';

/// Cores do design system Lumina Precision.
abstract final class AppColors {
  AppColors._();

  // Marca
  static const primary = Color(0xFF0F172A);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF131B2E);
  static const onPrimaryContainer = Color(0xFFDAE2FD);
  static const inversePrimary = Color(0xFFBEC6E0);

  static const secondary = Color(0xFF0058BE);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFF2170E4);
  static const onSecondaryContainer = Color(0xFFFEFCFF);

  static const tertiary = Color(0xFF0B1C30);
  static const onTertiary = Color(0xFF172434);
  static const tertiaryContainer = Color(0xFFD3E4FE);
  static const onTertiaryContainer = Color(0xFF0B1C30);

  /// Cor adicional de destaque.
  static const accent = Color(0xFF0EA5E9);

  // Superfícies
  static const surface = Color(0xFFF7F9FB);
  static const surfaceDim = Color(0xFFD8DADC);
  static const surfaceBright = Color(0xFFF7F9FB);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF2F4F6);
  static const surfaceContainer = Color(0xFFECEEF0);
  static const surfaceContainerHigh = Color(0xFFE6E8EA);
  static const surfaceContainerHighest = Color(0xFFE0E3E5);

  static const onSurface = Color(0xFF191C1E);
  static const onSurfaceVariant = Color(0xFF45464D);

  static const inverseSurface = Color(0xFF2D3133);
  static const onInverseSurface = Color(0xFFEFF1F3);

  static const surfaceTint = Color(0xFF565E74);

  // Bordas
  static const outline = Color(0xFF76777D);
  static const outlineVariant = Color(0xFFC6C6CD);

  // Feedback
  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  // Cores fixas Material 3
  static const primaryFixed = Color(0xFFDAE2FD);
  static const primaryFixedDim = Color(0xFFBEC6E0);
  static const onPrimaryFixed = Color(0xFF131B2E);
  static const onPrimaryFixedVariant = Color(0xFF3F465C);

  static const secondaryFixed = Color(0xFFD8E2FF);
  static const secondaryFixedDim = Color(0xFFADC6FF);
  static const onSecondaryFixed = Color(0xFF001A42);
  static const onSecondaryFixedVariant = Color(0xFF004395);

  static const tertiaryFixed = Color(0xFFD3E4FE);
  static const tertiaryFixedDim = Color(0xFFB7C8E1);
  static const onTertiaryFixed = Color(0xFF0B1C30);
  static const onTertiaryFixedVariant = Color(0xFF38485D);
}