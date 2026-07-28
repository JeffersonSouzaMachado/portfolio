import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalURL({
  required String url,
  required String error,
}) async {
  final finalUrl = Uri.parse(url);

  final opened = await launchUrl(finalUrl, webOnlyWindowName: '_blank');

  if (!opened) {
    throw Exception(error);
  }
}

Future<void> sendEmail({required String email, required String error}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': 'Contato pelo portfólio',
      'body': 'Olá, gostaria de conversar sobre...',
    },
  );

  if (!await launchUrl(uri)) {
    throw Exception(error);
  }
}
