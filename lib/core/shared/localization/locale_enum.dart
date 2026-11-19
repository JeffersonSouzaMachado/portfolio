import 'package:material_ui/material_ui.dart';
import 'package:portfolio/l10n/app_localizations.dart';

enum AppLocale {
  pt(Locale('pt')),
  en(Locale('en')),
  es(Locale('es'));

  final Locale locale;

  const AppLocale(this.locale);

  String get name {
    final localizations = lookupAppLocalizations(locale);

    return switch (this) {
      AppLocale.pt => localizations.portuguese,
      AppLocale.en => localizations.english,
      AppLocale.es => localizations.spanish,
    };
  }
}
