import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalURL(String url) async {
  final finalUrl = Uri.parse(url);

  final opened = await launchUrl(finalUrl, webOnlyWindowName: '_blank');

  if (!opened) {
    throw Exception('Não foi possível abrir o GitHub');
  }
}
