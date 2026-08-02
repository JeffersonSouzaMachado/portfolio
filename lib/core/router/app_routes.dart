import 'package:go_router/go_router.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/src/contacts/contacts_page.dart';
import 'package:portfolio/src/home/presentation/home_page.dart';
import 'package:portfolio/src/home_menu/home_menu_page.dart';
import 'package:portfolio/src/language_selector/language_selector_page.dart';
import 'package:portfolio/src/projects/projects_page.dart';
import 'package:portfolio/src/projects/widgets/project.dart';
import 'package:portfolio/src/projects/widgets/project_model.dart';
import 'package:portfolio/src/skills/skills_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LanguageSelectorPage()),

    ShellRoute(
      builder: (context, state, child) {
        return HomeMenuPage(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (_, _) => const NoTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: Routes.projects,
          pageBuilder: (_, _) => const NoTransitionPage(child: ProjectsPage()),
        ),
        GoRoute(
          path: Routes.skills,
          pageBuilder: (_, _) => const NoTransitionPage(child: SkillsPage()),
        ),
        GoRoute(
          path: Routes.contact,
          pageBuilder: (_, _) => const NoTransitionPage(child: ContactsPage()),
        ),
        GoRoute(
          path: Routes.project,
          pageBuilder: (context, state) {
            final project = state.extra as ProjectModel;

            return NoTransitionPage(child: Project(project: project));
          },
        ),
      ],
    ),
  ],
);
