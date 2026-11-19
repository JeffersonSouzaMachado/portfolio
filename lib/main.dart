import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/core/error/build_error_screen.dart';
import 'package:portfolio/core/shared/design/theme/app_theme.dart';
import 'package:portfolio/core/router/app_routes.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/language_selector/locale_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  usePathUrlStrategy();

  ErrorWidget.builder = (details) {
    return FriendlyErrorView(details: details);
  };

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(
      localeProvider.select((state) => state.locale),
    );

    return MaterialApp.router(
      title: 'theDevJeff Portfolio',
      theme: AppTheme.theme,
      routerConfig: appRouter,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
