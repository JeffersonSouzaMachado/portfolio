Future<String> prepareWhatsappMessage({
  required String name,
  required String lastName,
  required String subject,
  required String email,
  required String message,
}) async {
  final fullName = '${name.trim()} ${lastName.trim()}';
  final sub = subject.trim();
  final fullMessage = message.trim();
  final emailContact = email.trim();

  final whatsAppMessage =
      '''
  $sub
  
  *Nome*: $fullName
  *Email*: $emailContact
  
  _Mensagem_:
  $fullMessage  
  ''';

  return Uri.encodeComponent(whatsAppMessage);
}
