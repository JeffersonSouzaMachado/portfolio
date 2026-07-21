import 'package:go_router/go_router.dart';
import 'package:portfolio/src/home/homepage.dart';
import 'package:portfolio/src/language_selector/language_selector_page.dart';

import '../../l10n/app_localizations.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LanguageSelectorPage(
        languageList: [
          AppLocalizations.of(context)!.portuguese,
          AppLocalizations.of(context)!.english,
        ],
      ),
    ),
    GoRoute(path: '/home', builder: (context, state) => Homepage()),
  ],
);
