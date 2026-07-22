import 'package:go_router/go_router.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/src/contacts/contacts_page.dart';
import 'package:portfolio/src/home/home_page.dart';
import 'package:portfolio/src/home_menu/home_menu_page.dart';
import 'package:portfolio/src/language_selector/language_selector_page.dart';
import 'package:portfolio/src/projects/projects_page.dart';
import 'package:portfolio/src/skills/skills_page.dart';

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

    ShellRoute(
      builder: (context, state, child) {
        return HomeMenuPage(child: child);
      },
      routes: [
        GoRoute(path: Routes.home , builder: (context, state) => HomePage()),
        GoRoute(path: Routes.projects, builder: (context, state) => ProjectsPage()),
        GoRoute(path: Routes.skills, builder: (context, state) => SkillsPage()),
        GoRoute(path: Routes.contact, builder: (context, state) => ContactsPage()),
      ],
    ),
  ],
);
