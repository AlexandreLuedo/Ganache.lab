import 'package:url_launcher/url_launcher.dart';

void openEmail() async {
  final subject = Uri.encodeComponent('Contact - Application Ganache.lab');
  final Uri emailUri = Uri.parse(
    'mailto:contact.ganache@pm.me?subject=$subject',
  );

  if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
    print('Impossible d\'ouvrir l\'application mail');
  }
}
