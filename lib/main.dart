import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/core/localization/locale_provider.dart';
import 'package:portfolio/core/router/app_routes.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/l10n/app_localizations.dart';

void main() {
  usePathUrlStrategy();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'theDevJeff Portfolio',
      theme: AppTheme.light,
      routerConfig: appRouter,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
