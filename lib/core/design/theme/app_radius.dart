import 'package:flutter/widgets.dart';

abstract final class AppRadius {
  AppRadius._();

  static const sm = 4.0;
  static const regular = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const full = 9999.0;

  static const borderSm = BorderRadius.all(
    Radius.circular(sm),
  );

  static const borderRegular = BorderRadius.all(
    Radius.circular(regular),
  );

  static const borderMd = BorderRadius.all(
    Radius.circular(md),
  );

  static const borderLg = BorderRadius.all(
    Radius.circular(lg),
  );

  static const borderXl = BorderRadius.all(
    Radius.circular(xl),
  );

  static const borderFull = BorderRadius.all(
    Radius.circular(full),
  );

}