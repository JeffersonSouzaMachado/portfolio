import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/contacts/widgets/form_contact_field.dart';
import 'package:portfolio/src/contacts/widgets/prepare_whatsapp_messge.dart';
import 'package:portfolio/src/shared/gradient_container.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

import '../../../core/shared/design/theme/app_colors.dart';
import '../../../core/shared/design/theme/app_spacings.dart';
import '../../../core/shared/design/theme/app_text.dart';
import '../../../l10n/app_localizations.dart';
import '../../shared/validators/form_validator.dart';

class ContactForm extends StatelessWidget {
  ContactForm({super.key, this.isMobile = false});

  final bool isMobile;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return GradientContainer(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.gutter,
          vertical: AppSpacing.xl,
        ),
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Form(
            key: formKey,
            child: Column(
              spacing: AppSpacing.lg,
              children: [
                if (isMobile)
                  Column(
                    spacing: 20,
                    children: [
                      FormContactField(
                        label: appText.labelName,
                        hintText: "John",
                        controller: _nameController,
                        validator:  validateName,
                      ),
                      FormContactField(
                        label: appText.labelLastName,
                        hintText: "Doe",
                        controller: _lastNameController,
                        validator: validateLastName,
                      ),
                    ],
                  )
                else
                  Row(
                    spacing: AppSpacing.md,
                    children: [
                      Flexible(
                        child: FormContactField(
                          label: appText.labelName,
                          hintText: "John",
                          controller: _nameController,
                          validator: validateName,
                        ),
                      ),
                      Flexible(
                        child: FormContactField(
                          label: appText.labelLastName,
                          hintText: "Doe",
                          controller: _lastNameController,
                          validator: validateLastName,
                        ),
                      ),
                    ],
                  ),
                FormContactField(
                  label: appText.labelEmail,
                  hintText: "john@company.com",
                  controller: _emailController,
                  validator: validateEmail,
                ),
                FormContactField(
                  label: appText.labelSubject,
                  hintText: appText.subjectText,
                  controller: _subjectController,
                  validator: validateSubject,
                ),
                FormContactField(
                  label: appText.labelProjectDetails,
                  hintText: appText.projectsDetailsText,
                  height: 150,
                  controller: _messageController,
                  validator: validateMessage,
                ),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.onPrimaryContainer.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    onPressed: () async {
                      final isValid = formKey.currentState?.validate() ?? false;

                      if (!isValid) {
                        return;
                      }

                      final whatsappMessage = await prepareWhatsappMessage(
                        name: _nameController.text,
                        lastName: _lastNameController.text,
                        subject: _subjectController.text,
                        email: _emailController.text,
                        message: _messageController.text,
                      );

                      final whatsappUrl =
                          '$whatsAppUrl$phone$whatsappText$whatsappMessage';

                      openExternalURL(
                        url: whatsappUrl,
                        error:
                            'Não foi possivel enviar a mensagem pelo whatsapp',
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AppText(
                            appText.sendMessage,
                            maxLines: 1,
                            color: AppColors.inversePrimary,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.send, color: AppColors.inversePrimary),
                      ],
                    ),
                  ),
                ),
                Text(
                  appText.agreeText,
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.inversePrimary,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
