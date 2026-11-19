import 'package:material_ui/material_ui.dart';

class LocaleState {
  LocaleState({required this.locale});

  final Locale locale;

  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }
}
