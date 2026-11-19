import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/language_selector/locale_state.dart';

class LocaleNotifier extends Notifier<LocaleState> {
  @override
  LocaleState build() {
    return LocaleState(locale: Locale('pt', 'BR'));
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, LocaleState>(
  LocaleNotifier.new,
);
