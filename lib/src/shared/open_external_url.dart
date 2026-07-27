import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalURL(String url) async {
  final finalUrl = Uri.parse(url);

  final opened = await launchUrl(finalUrl, webOnlyWindowName: '_blank');

  if (!opened) {
    throw Exception('Não foi possível abrir o GitHub');
  }
}



Future<void> sendEmail({required String email}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': 'Contato pelo portfólio',
      'body': 'Olá, gostaria de conversar sobre...',
    },
  );

  if (!await launchUrl(uri)) {
    throw Exception('Não foi possível abrir o aplicativo de e-mail');
  }
}