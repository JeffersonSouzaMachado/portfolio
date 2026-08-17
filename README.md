# Portfolio

Jefferson Machado's web portfolio, built with Flutter Web to present a professional profile, skills, experience, projects, and contact options.

This project was created to run on the web only. There is no configuration or intent to build for Android, iOS, desktop, or other platforms in this repository.

## Features

- Language selection on the first screen, with support for Portuguese and English.
- Web navigation with clean URLs using `GoRouter` and `usePathUrlStrategy`.
- Home page with a professional summary and metrics loaded from Firestore.
- Projects page with listing, details, stack, mockups, and links to Play Store and App Store.
- Skills page with technical skills, soft skills, and professional journey.
- Contact page with external links, email, Calendly, and WhatsApp message preparation.
- Friendly screen for rendering errors.
- Responsive layout for desktop and mobile.

## Technologies

- Flutter Web
- Dart
- Material
- GoRouter for routing
- Riverpod for state management and providers
- Firebase Core and Cloud Firestore for remote content
- Flutter Localizations and `intl` for internationalization
- Flutter SVG for rendering SVG files
- Lottie for animations
- Lucide Icons Flutter for icons
- URL Launcher for external links, email, and WhatsApp
- Fpdart for shared functional types
- Flutter Markdown for formatted content
- Outfit font

## Prerequisites

- Flutter installed with Web support enabled
- Dart compatible with the SDK defined in `pubspec.yaml`
- Chrome or another browser available for local execution
- Firebase project configured for web, using `lib/firebase_options.dart`

Check the environment with:

```bash
flutter doctor
flutter devices
```

## Installation

Install the project dependencies:

```bash
flutter pub get
```

## Firebase and Remote Data

The app initializes Firebase in `lib/main.dart` with `DefaultFirebaseOptions.currentPlatform` and accesses Firestore through `lib/core/firebase/firestore_provider.dart`.

The main consumed collections are:

- `metrics`: metrics displayed on the Home page.
- `projects`: localized projects and project details.
- `skills`: technical and behavioral skills.
- `experiences`: professional journey experiences.

Remote datasources are located in:

```text
lib/src/home/data/datasources/
lib/src/projects/data/datasource/
lib/src/skills/data/datasources/
```

Remote content uses language keys such as `pt`, `en`, `portuguese`, and `english`, depending on the collection.

## Internationalization

Translation files are located in `lib/l10n`:

- `app_pt.arb`
- `app_en.arb`

The generator configuration is in `l10n.yaml`:

```yaml
arb-dir: lib/l10n
template-arb-file: app_pt.arb
output-localization-file: app_localizations.dart
```

To generate or update localization files, run:

```bash
flutter gen-l10n
```

The project uses `flutter: generate: true` in `pubspec.yaml`, so generation can also happen together with Flutter commands, such as `flutter run`, when needed.

## Routes

Routes are centralized in `lib/core/router`:

```text
/          language selection
/home      home page
/projects  project listing
/project   project detail
/skills    skills and experience
/contact   contact
```

The `/project` route receives the selected project through `state.extra`.

## Running Locally

Run the project in Chrome:

```bash
flutter run -d chrome
```

To choose another available web device, list the devices:

```bash
flutter devices
```

Then run the project with the desired device:

```bash
flutter run -d <device-id>
```

## Web Build

Generate a production web build:

```bash
flutter build web
```

The final files will be generated in:

```text
build/web
```

## Tests and Analysis

Run automated tests:

```bash
flutter test
```

Run static analysis:

```bash
flutter analyze
```

## Main Structure

```text
lib/
  main.dart
  firebase_options.dart
  core/
    error/
    firebase/
    mappers/
    router/
    shared/
  l10n/
  src/
    contacts/
    home/
    home_menu/
    language_selector/
    projects/
    shared/
    skills/
assets/
  fonts/
  images/
  lotties/
  svg/
web/
```

Each main feature follows a layered organization:

```text
data/
  datasources/
  models/
  repositories/
domain/
  entities/
  repositories/
presentation/
  providers/
  widgets/
```

## Assets

The project includes:

- Outfit font in `assets/fonts`
- Raster images in `assets/images`
- Lottie animations in `assets/lotties`
- SVG files in `assets/svg`
- Web files in `web`, including `index.html`, manifest, favicon, icons, and the font used by the web build
