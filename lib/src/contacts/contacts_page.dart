import 'package:flutter/material.dart';

import 'package:portfolio/core/shared/design/theme/app_spacings.dart';

import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/contacts/widgets/contact_form.dart';
import 'package:portfolio/src/contacts/widgets/description_widget.dart';

import '../shared/footer.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 550;

        if (isMobile) {
          return mobile(appText: appText);
        }

        return desktop(appText: appText);
      },
    );
  }

  Widget mobile({required AppLocalizations appText}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.gutter),
            child: Column(
              children: [
                description(appText: appText, isMobile: true),

                ContactForm(isMobile: true),
              ],
            ),
          ),
          Footer(isMobile: true),
        ],
      ),
    );
  }

  Widget desktop({required AppLocalizations appText}) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.gutter),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: description(appText: appText)),
                const SizedBox(width: 50),
                Expanded(child: ContactForm()),
              ],
            ),
          ),
        ),

        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: const Footer(),
          ),
        ),
      ],
    );
  }
}
