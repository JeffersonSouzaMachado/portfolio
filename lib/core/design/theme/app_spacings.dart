import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  AppSpacing._();

  static const base = 4.0;

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 40.0;
  static const xxl = 64.0;

  static const gutter = 24.0;

  static const mobileMargin = 16.0;
  static const tabletMargin = 32.0;
  static const desktopMargin = 48.0;

  static const pagePaddingMobile = EdgeInsets.symmetric(
    horizontal: mobileMargin,
  );

  static const pagePaddingTablet = EdgeInsets.symmetric(
    horizontal: tabletMargin,
  );

  static const pagePaddingDesktop = EdgeInsets.symmetric(
    horizontal: desktopMargin,
  );
}