



import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio/l10n/app_localizations_en.dart';
import 'package:portfolio/l10n/app_localizations_es.dart';
import 'package:portfolio/l10n/app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static final List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @availableForProjects.
  ///
  /// In en, this message translates to:
  /// **'Available for new projects'**
  String get availableForProjects;

  /// No description provided for @architecting.
  ///
  /// In en, this message translates to:
  /// **'Architecting'**
  String get architecting;

  /// No description provided for @highPerformance.
  ///
  /// In en, this message translates to:
  /// **'High-Performance'**
  String get highPerformance;

  /// No description provided for @mobileEcosystems.
  ///
  /// In en, this message translates to:
  /// **'Mobile Ecosystems'**
  String get mobileEcosystems;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer specializing in Flutter and Dart, with a focus on performance, fluid interfaces, and robust software architecture. I build responsive and well-structured experiences for mobile and web applications.'**
  String get aboutDescription;

  /// No description provided for @viewWorks.
  ///
  /// In en, this message translates to:
  /// **'Works'**
  String get viewWorks;

  /// No description provided for @github.
  ///
  /// In en, this message translates to:
  /// **'Github'**
  String get github;

  /// No description provided for @labelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelName;

  /// No description provided for @labelLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get labelLastName;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'Your best e-mail'**
  String get labelEmail;

  /// No description provided for @labelSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get labelSubject;

  /// No description provided for @subjectText.
  ///
  /// In en, this message translates to:
  /// **'I\'ve idea to app'**
  String get subjectText;

  /// No description provided for @labelProjectDetails.
  ///
  /// In en, this message translates to:
  /// **'Project details'**
  String get labelProjectDetails;

  /// No description provided for @projectsDetailsText.
  ///
  /// In en, this message translates to:
  /// **'Tell me about your vision, technical requirements, and timeline...'**
  String get projectsDetailsText;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get sendMessage;

  /// No description provided for @agreeText.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to the terms of use and to the professional and responsible processing of your data.'**
  String get agreeText;

  /// No description provided for @cannotOpenExternalUrl.
  ///
  /// In en, this message translates to:
  /// **'Cannot open external URL'**
  String get cannotOpenExternalUrl;

  /// No description provided for @sendEmailError.
  ///
  /// In en, this message translates to:
  /// **'Cannot open email provider'**
  String get sendEmailError;

  /// No description provided for @connectivity.
  ///
  /// In en, this message translates to:
  /// **'Connectivity'**
  String get connectivity;

  /// No description provided for @letsBuildNextGenerationOfTech.
  ///
  /// In en, this message translates to:
  /// **'Let\'s build the **next generation** of tech.'**
  String get letsBuildNextGenerationOfTech;

  /// No description provided for @specializedText.
  ///
  /// In en, this message translates to:
  /// **'I specialize in high-performance mobile architectures and scalable cloud solutions. Reach out to discuss a collaboration, a project, or just to talk tech.'**
  String get specializedText;

  /// No description provided for @writeToMe.
  ///
  /// In en, this message translates to:
  /// **'E-mail me'**
  String get writeToMe;

  /// No description provided for @operationBase.
  ///
  /// In en, this message translates to:
  /// **'Base of Operations'**
  String get operationBase;

  /// No description provided for @shareMyPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Share my Portfolio'**
  String get shareMyPortfolio;

  /// No description provided for @callMeOnWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Call me on WhatsApp'**
  String get callMeOnWhatsapp;

  /// No description provided for @readyToJumpIn.
  ///
  /// In en, this message translates to:
  /// **'Ready to jump in?'**
  String get readyToJumpIn;

  /// No description provided for @scheduleAnCall.
  ///
  /// In en, this message translates to:
  /// **'Schedule a 15-min discovery call.'**
  String get scheduleAnCall;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get schedule;

  /// No description provided for @underConstruction.
  ///
  /// In en, this message translates to:
  /// **'Under Construction'**
  String get underConstruction;

  /// No description provided for @projectMockups.
  ///
  /// In en, this message translates to:
  /// **'Project Mockups'**
  String get projectMockups;

  /// No description provided for @appOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get appOverview;

  /// No description provided for @appChallenge.
  ///
  /// In en, this message translates to:
  /// **'Challenge'**
  String get appChallenge;

  /// No description provided for @appSolution.
  ///
  /// In en, this message translates to:
  /// **'Solution'**
  String get appSolution;

  /// No description provided for @showcaseHeadTitle.
  ///
  /// In en, this message translates to:
  /// **'Engineering Excelence'**
  String get showcaseHeadTitle;

  /// No description provided for @showcaseHeadText.
  ///
  /// In en, this message translates to:
  /// **'A curated showcase of high-performance mobile applications, ranging from fintech solutions to real-time communication platforms. Built with precision and optimized for the modern edge.'**
  String get showcaseHeadText;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @errorLoadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Oh No, Something went wrong here, but we\'re going to fix it!'**
  String get errorLoadingMessage;

  /// No description provided for @backAgainLater.
  ///
  /// In en, this message translates to:
  /// **'Come back later.'**
  String get backAgainLater;

  /// No description provided for @loadingPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Loading, please wait...'**
  String get loadingPleaseWait;

  /// No description provided for @skillsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Mastery & Professional Path'**
  String get skillsPageTitle;

  /// No description provided for @skillsPageDescription.
  ///
  /// In en, this message translates to:
  /// **'A comprehensive overview of my core competencies, architectural expertise, and the evolution of my professional career in high-performance systems'**
  String get skillsPageDescription;

  /// No description provided for @technicalProwess.
  ///
  /// In en, this message translates to:
  /// **'Technical Prowess'**
  String get technicalProwess;

  /// No description provided for @professionalJourney.
  ///
  /// In en, this message translates to:
  /// **'Professional Journey'**
  String get professionalJourney;

  /// No description provided for @viewOnPlayStore.
  ///
  /// In en, this message translates to:
  /// **'View on Play Store'**
  String get viewOnPlayStore;

  /// No description provided for @viewOnAppStore.
  ///
  /// In en, this message translates to:
  /// **'View on App Store'**
  String get viewOnAppStore;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
